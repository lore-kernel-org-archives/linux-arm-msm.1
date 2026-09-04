Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED643672BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515932; cv=none; b=lMYMET1BPlwOQ6t4ic2St9voJDFNtxqflMHyjymDkmEcn3WAEHAXsDNeDe6d/l/LFDO6V7X3U8F8XTXemYEGW4pjLjGb8KUAnCPMXtmBDQM2P1yRcgIWhgqKM61R82+ZqscMPQtJSVbjtbeMW6x8XtMY0SXRgxdOfbCsO8R0Kf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515932; c=relaxed/simple;
	bh=RZQOYcB2jiyDS2LXspF4SSZXkopk8ECCnx7tcJS2WBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTPz2PRKmf6/DGTqNNaoSXAW6/fUXQY7/f/0kHdcHNa0hSAdyUbwJfxhwHRRAhAGcrQBmtQX2KtfPUMWOINWjA0R9z69SXfHK/xQpXsSm3WZpVxPm2j6iUDtgtI9wPiXCLpQzQ1qRX7A9qfpenGaujJk5a4deXSgPZFWJzveTiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WP/Rvuk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VU8GmYG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WP/Rvuk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VU8GmYG2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847nKiQ3454622
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 09:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=; b=WP/Rvuk5si27fCdX
	TbcfRpWjVbcDEv9gjtvk/TIZDS15BYTju2ehorhc6zlNx6aPTmFUGCBkyJJH5zgS
	Sr4nwBY//P6buJ/BlyOzc3xaEjmloKOhHd+sT3hiPyy+AfCL47tcAFKS1qHlOIXi
	tehsv/3w9b63NCc2qEX7JIAZ1R+ECmTk/NbhyL3FF491HwcXar3AhUSclMOYNCPa
	NfhkCmiIScgCxUJyUl+NJWTLN58bVbZ+lEkPKUWMhFAI/ulTWQbC4tlOxVKms7kw
	+uHWpRPKMh1Pijf9yyfma7PLAMTk5PYOfqueCSJZFv27pg23Fd2V9AsthO+swzvm
	je6Nbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfhc9t40u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 09:58:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ea38b1e7eso2100791cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515928; x=1789120728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=VU8GmYG25SOrFa+ObUDtJJsKkelQbfipgzxFEuzfoA5APtSiaNLBfKZIMOhOUitKat
         RAvjTqsKsj5PywhEho6G4zbZfJaH8tyt+SamfOLeUoABjKXCaJvpX6ZSaiOmdG92xFPj
         fbHTmVmj8lJa3WphIzdLYPEFmuN1rc10CshiGqIny3jd1yKQebjRiMnwUKJcsmlfbaky
         OrGYPDrxZCF373C69GSlS7cKyQNMZyn1LytSFvrmzJsKcS8jOtNxhU3vS1sjSF8Llrz4
         gZmAozGJI2+QSZuzvxMkJHT8ELcqgx+JspiwI0Q/1LhTQq/lP5GWmM12O1fRBMRBhO8r
         DUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515928; x=1789120728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqAuchompu3l6D1ZozbSUxqS4M5NQnoxNVQJa4gwHNc=;
        b=nF0lFTCfBxLtPMdAynMPZ//Pcp7IApCzpVDOV/WdRiZ9dPbST+Rnd93vbVnxSz7KI8
         mrS5me5uKYtuIFZu/Gs4QZW+3qSoUDdH8bANcvO7BkZGNTJ36ELxEZZ/XSvpL71jISs3
         0yY6DNVmfDVjgtoWj5OIodutmxP74Y99+us2Kcif2F48c749nPrAl0oK1kV8et6hVCyj
         3pThL5D3fhes9ObwMJNFfDZGRZ+v6UozEmh4BwNjSu7AwJawJzOsUOVt8qs9CEWMfSir
         z1Tmc6LMrpM5Yk+Xg/Y+he43hGyBauvSNCIDBxlfRniWwqHb8IOjv/Z74dbR8dJ5A+8g
         4w1w==
X-Forwarded-Encrypted: i=1; AKwUvBz3DcdhuqVXNd/fiUDusdlEd8AGSVENoEQx+5GHr1cZDAbb0+We7BMdj0NwvJxeXX6JvtXZx9o8rQ34mZj1@vger.kernel.org
X-Gm-Message-State: AFuF++m5DZMT1HeimiP9pwC/iCIAew6i07dg/yOMbwhwWfm5esvSpvd1
	iqIbRwOh8JqZGySkp+1AeifggQF6K+4bDJrKjG5CYyD8ctpsXFda3iKYud1Z6Wz0dCzB5luGw4r
	IrcoOPJQ6YT7P+N4n3fUuyvhcbtM2Fesu83Tx8IrA3o0vr5ZnfTVcj90OVEycRtHNtXoP
X-Gm-Gg: AYBFou1qLRWntAcPBk1lr8rOjg4Kauk6UoR6RF9e9dY2S/HpwXy81/NwDNzBrAW3NYi
	VPEr7uVavavgT2gJuEB5ZTg774SrOeWRCszdXK11kIR1tMCdURUVC9mYgwmGXpgRnx1IlEODvXm
	P9JtxLYHTyR0lVxMS+1BZVIOBqCO2qwZVDZ4kfPxdV186iHRE5CQoNP189qU8vSde/xq2TnAzrJ
	P6f1s82tkFApy7o47ims0XLrV3tt0DjlfodnPLmWwCIfci2jkTtM7ch9MFE5YHM/9NKDalpCzEl
	/6bifZUImf1Y/3tJu4Vgb/MDaGKe7k0Vc8QWttx6qxtDdYAaci+la388GSu9Kv+KIbHyofgzRwt
	+EptAw0swVOiZft35KX35cA==
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301876485a.0.1788515928465;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:27c4:b0:939:5924:e319 with SMTP id af79cd13be357-939803ac3b9mr301874685a.0.1788515928017;
        Fri, 04 Sep 2026 02:58:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm84604766b.14.2026.09.04.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:58:47 -0700 (PDT)
Message-ID: <17067330-5c1c-46cb-a0b1-7e328820bce4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afdRWxot c=1 sm=1 tr=0 ts=6a9a9659 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YHrH2t1qFSG2L-rfozMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX6iQHv9+TC//t
 oGel73HZXqL/R7RuGErkrZCwRqYjuyADehJt79veZiINHo+CkYNUopbp7kejYCUZe9cNZJZT7RX
 BuP7E4OwOusXWb2ppJlUV5E2KRCJSDKQgd2GVvXApqs2hwehAerzSBw/rmjJXVI9wuU9HsfKtvz
 b435NQ6shsNlxoIMyJydoxedU8picsz2z73T8rYaC2lMOhOhZwhS5XIcihLxKPybbqPqgW5wI+K
 GgpLqk9UBgu8pfA1J1q/FML/JE+JA0SF0ynxL2wT9OUNrfLWYc75l4TC+Yu1daHcbjKS9IpexUO
 aZINiqjaRnHTEDVtwhDdZfwv7KGJkjPV8zhi9L97S7MYS78JOIp5wG2t0gq9lsMpxltVEyzm9I4
 cYCCi+p9bE4jm+q/JBW+5bxsyEZdKakRPzpSzByM6DPPqjDo7lpS/+NmEvKvf/jif+opdbJ6i+4
 IXOiSkqqf56FpHPv3gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX19t3xC57yNVI
 XBma3wbXECwo68roPuiXX+RQZwarM+GOfFA6Jn6ZqKM7YqD0MheDpiHuEMHAdQMQJXbWJG5Y8eD
 xwCPm+kUM0QD1+L6iORjFIYfJ6xVpOM=
X-Proofpoint-ORIG-GUID: ctNeBwFd2BkbkafBNyFov8x6QgJ7QxID
X-Proofpoint-GUID: ctNeBwFd2BkbkafBNyFov8x6QgJ7QxID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
