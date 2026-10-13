Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C33426431
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884636; cv=none; b=tvGDa3QcThbVg9PpkWRufrBFbHgKMFtYo+CtYkpH2QA3Lr8RCVx68elOTnpdEQNNueYx6eZI3wM+WW+C2YbLwQrSJ0+M2YHhWn3Q8u5TQG+/IeCJYzBootxOKHh9/A8Z8Shbdn59DlUuiyjF3ywcnQ38zm/eceKiQpyk2hirXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884636; c=relaxed/simple;
	bh=/as17aOfJMK/3CjhOCiUa8dmZZDXaYvY9L11wwmexNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot6jiv+6yrlgSUPKGZxTrFZLzxiEBuC/o8FBnTH9Jx/ajhbTnp0mRz3ajgbEBVfIWf1HeASMk4GrNxMwlf7VxeK12anpXUU3pmmj3RXsmgu2r7Zd3etsxPyGekhpaqZxgnQZRLznqSdttca3TekLlafoR9Q8haz1K9+lLQLCfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjhTMUYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQV+4OaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjhTMUYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQV+4OaL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xv9a790829
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=; b=NjhTMUYbZByWDw+z
	ore+1ZLTN3xO05rZ0gROL5ucutY3FqpnLiS0L6Jn6MtalYpfWKn8OReEtJF1L3xt
	wJ/rWIks5WLuHXudygGX2sfCKGMMKZz3+CxVZK0j+Q5M0o/xH4L0CydjZ7+deVBi
	2TNKpPgG8U18tnG0lHrgA+3dwG24706xHBnxH+F2h5zzO4LpSBw5GnfanUyctyD1
	yGU6fjCw0cvAFhEPYQEwv0XM4yzT5WhAYbz/W2acjrFf2MktZJ0oT9uHehDPWL7C
	wKIR20yqQ5bL6aegxMQ4DhUD3gm4TaJabuNEyPBMk1RRbrXgLPORpg9iVuqU2Wcl
	yZ6/uw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjr66p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:43:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7295398eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791884633; x=1792489433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=ZQV+4OaL4nJdC3m+1O4Q3TO0UCQGtV6Z88QQp4Rutpw2nSXSLC8sTbSKeHXrnR5sJ3
         NiSKw+/fR42W/NZGPXC2xCKlATxiasCcQLbcivAO31MKTBxletn2C2Uaqb5CMZkvsjO6
         +QSyGOS/Gd09EybodK8nQwEHTKVtJ3U8qZAxzF8jAXFiptfTlXHnCyUIbA6na1me8+Rb
         nGst6V++rTDlGs+mK44dpGi5wWpwCeOOy8WQaJ7oeYyVjIx65tHX842RBjG/qyDGcIcw
         JTYD0c4wsYXx+5kQE6aNHLp8ZopVCHU33NkVtzS3LCbKW2AtHR95PYykHc3GulPyv5wS
         yghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884633; x=1792489433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh1iMTClijqpaj9gdgAS4IuwEhu0EICZuW2Z1ZAGoro=;
        b=lU1SKavojOiieho4k7cmIfUGZrIMr5LiYaqJGFh3NGQieuykDaOxX/dFIV51bBVSPh
         ImhJ+3ztNTAELMBid1CwVtUmPHfu9D12fdyTqtfaHm34kNJ5ycdI7F6A/FnwJDaYIxdR
         WlXGKutwtvKlyx5E6Zsa+B1ndul8hFLBUF8Sh8aknoeIhAmm50BuosMZGZVNO7sb5mNN
         TuhZhyB+R2QqgWC5TCmxXAJt8H9aAWll7B2utSXzNxvarwuqtJzmULfSAFHMuZY8znEo
         xlUuPBr5eNreE7czpPdFVucAFv5HnNtYIYDKTRnmaAqVC86UyUVLcylMMTAbU5FwxCtx
         zGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbdiuOn/LAHKYGMbt96WC62xdWgbxOChyzOPyFXN9yhMAYwd+8qUY6M6fX/3qpUQsjsKMZalOFJhxRwPxV@vger.kernel.org
X-Gm-Message-State: AFq9FYJJa4n/CWJ0LYNKSeY3N7fWI5oD4G9srx5wqFU79zt5i4j0mbwG
	U3pPPInOfP7Ssd5ZGITp6Y00Al6ZiwxpaysSIn30duaMOHsfO8pB4nk+hUj+sHx8l2X3WzcUyq3
	HR5ha9DYk0v/FjkrsMUr8hTUHTUWRU3Ct/96xaV+0IfngiQy+JmYWsuWb2lO+WG7jo1id
X-Gm-Gg: AYBFou03plJyzf00hj+yPJ/xff3eqiGrdSUO0bAFwnCZutiRjfZSc99PFjKN9YxcBol
	oFnt+MP8OZdD/rl0snOOhR02yfCK4vGisGGvUsQ8KoUTwM2omLVrRzexNhbvgjCbJqV1LVw75dr
	8z7zqGXXD6GHERUjpJ60ljtD1Q5EcMnTfpTtX8EGXe9kbDpccpGR6EieAa49rUsR7cNIXI3we6z
	5rbF2wjfWf5CXKWKgH1kn/H5cYfDLik+P39ZiQ443OSRw+6ZM5NrYmbE7h18spDzVbzd1vt78LA
	CpRhQShJu1muwuIEwUZUuNfkBv5SqqW968G67pBcfzy6qk6qibILSuUI1GU33vu8bCUgE5d2reS
	CLBxfRVixJOZt6beP2MxJQo6hj7Ok
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604298eec.1.1791884633206;
        Tue, 13 Oct 2026 02:43:53 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:10b0:35a:60d6:8c09 with SMTP id 5a478bee46e88-35a60d6b499mr8604268eec.1.1791884632686;
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm39101861eec.6.2026.10.13.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:43:52 -0700 (PDT)
Message-ID: <d6aa17d9-828b-45ea-b2bf-940f855a00cf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:13:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] regulator: qcom-rpmh: Add support for
 regulator-off-on-delay-us
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>
References: <20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com>
 <20261001-regulator-off-on-delay-v4-2-258ba9612da8@oss.qualcomm.com>
 <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <asZvhvK5kB9DyemI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX8/+s0UN/qT4o
 Gj5SUCxpfqVNHtBmLNjf75K34DUvrxZbKhYyV55EFVJCUI0fwo9sx1buFV1Wm7Tryy12HSqR3V/
 lz0u/vBF+Catet+pi4MHzpRP/sS1+TI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOCBTYWx0ZWRfX6sCx4QQO4LyD
 HU7Zoodo7QniJoNb+rNAcCfWJIipLxYuc0VvMyqJsrskpzjc2xjLdKv5A/JSa1Y1ZSMX2PAgjsC
 gh+i/rVe6D28cyn6vJix4noXXLNFAUQ+hvoDTmksEhs7Pkw85FYZh2wfOmwBG5Ltn8T+QIBPNx9
 HX2fkl+XLbj+IczFMrjWwsGbMUa2QmWByGrr2XhoUTdYANOhPLaY/zEw6SVekqNuGmbUvSWJeE2
 MN+jtR1agUpZ924EceqHAVMaOzknPxA3l73zV/Y1KX19NNpwrlIpyD94ApQICo13VwPIXFVRyQR
 TdxsOpC0m1bllkwxEUtHGEtIRNctPOWzjGiB2DktnnmIdOWLKuCK1V/no2tKzFPTguDEH5RKOd/
 xtaTL6IPFRzn//e0Uv0sVmu6s/6EprHDt477By/aNNkCeio8gaqd4IKrxEP2z8/xpBTvO+KS3Ow
 tWEDX/9mCocstRRwuAg==
X-Proofpoint-ORIG-GUID: H25GFpKpLa8WElVq_zJH1rvhZQCzBn2s
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6acdfd5a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7UbeVSx6ShU6YajrLr4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: H25GFpKpLa8WElVq_zJH1rvhZQCzBn2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130038

Hi Mark,

On 10/7/2026 9:42 PM, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 06:16:29PM +0530, Jishnu Prakash wrote:
> 
>> Add support for parsing the 'regulator-off-on-delay-us' property from
>> the device tree to enforce this physical constraint.
>>
>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-rpmh-regulator.c | 3 +++
> 
> Since this is a generic property I would expect it to be parsed by the
> regulator core, is there some reason for making it driver specific?

No, there is no such reason for now, we'll make this change in the
regulator core as you suggest.

Thanks,
Jishnu

