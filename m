Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE43932EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044789; cv=none; b=MnOewRohsKZUVODn6kTQjreCE1WT6cI1PAIl5bavhwhkxPbEQ1Dgk9wJa/TwVrrvWHAWkuJ/kIAIjXKFrAkwusLYCzSHtoIHDg9C+j4z0uvPKgBiKz0qWSfT0QXIcHVzn3qjd1HHwePhJBeNwQP+Pt66e1tIYQpr4JExdf+YLCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044789; c=relaxed/simple;
	bh=XfuFldQiDjKk+fSInbP0OZ+TkOlz9mD+00MrR1TZBfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwC8wZ5G9NDOXx/L+LaVJrgY0YzwIFsRKE9u3elGY5fbirjDpw8xeXduw9mCRAgfu8mZgPZp2TWLe+8wEA/DAXrPDsMP/elv30fRx3fz9dQHysam6E0+v2bprGZ7fAYBbodtIMerd9WoEjuWdHtnLLF6OR95WckUuHEP2Xwh32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzCXO3OF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEaFTTaB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzCXO3OF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEaFTTaB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BIgo747813
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEb0eiCY9gpAiqgkh3o5eFVvEJnOZqvJ0h/527enBEc=; b=TzCXO3OFbqZ+4hiN
	BmQniX0ykg5oe4wQIW37MpYhwJA+I45kEOCAZXNoM9pXfTr745lJnyphKTbGec/5
	7MAdAH5CHXtoS2zipbdBWsOqXUllWao++UlzrM2POSS4Tfizhqs0pEq9T0jraiwv
	V318uie38ih169tDneEuvtCHwmBvmoQfehSCNp+1KIur8NstyfUVA46rYhQP1rZq
	HaIUeiuxOo8JYuYP8JRrXEKqi2KbTQbwr4zkzPpIGAtFaTvlBJR5SuHyW85WJwYN
	uB4pt/uEKNCnRloZxs0f3eeBoDGoBNXULyW7lvFB77ynrAD9La3nRdRjiMpuLVVg
	C9yr+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0txnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:19:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936bc854d04so20580985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044787; x=1787649587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEb0eiCY9gpAiqgkh3o5eFVvEJnOZqvJ0h/527enBEc=;
        b=SEaFTTaB4c7OT8RFjhsvTExMyBVhScFRX4uwQdHY+WGs2WRgPa7Wy7hcpTraTLMV01
         XTANnUMnPgf7mTunvCwmCgKip1POzBJus34QVuowd2OTqDNNfy73CUHIbW0zliSkRD2W
         X/AeLnDs1jIp/U4znfyWJ4Q9KIyGnr4qRdyzCoxVrTmeMG3OQlA7EXA2nJJbntuI41ZX
         tRwylYICmUjqmvvpi8ICwyjGX1PCIa1SHHmGcYG0oiITroCHAFEyUOqk9s2rsygJsGQH
         FQtSe30a69yUSb2HElB2tjnGwPoaxfeHrHcks2x9iLIthzhRka+2vQ4+mtRVv9SdghFL
         D0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044787; x=1787649587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEb0eiCY9gpAiqgkh3o5eFVvEJnOZqvJ0h/527enBEc=;
        b=QcoZIQozEfnZhXibP5AdjNQPMQvWr0epw3ngOxjzXXce3MPe5fKJfGxxDzCa1y9Mwi
         JlmPSkEZwhG9P0kG/IdGZGVu39CKpdztz5p4PfgWbqAt2B/9RH6E7KKywX41tRv+biTU
         SraQV5Hnxkzj1q8R7hNbKLLy4dhJtEkIrz/dFDQZgmz/2A9rwod1LHAjDX2LQrnS9pza
         Irhb16B/x5tWIZcI3IIKQEuk3g/HfJUAbnb66GuJmZWvvIzJI3lu/4Ci1taXbqGSVk6E
         4Y44yK8nTaXUrRP/pkjSkDZAVd/L1OQB3MrSTcGWNntzMaDC8NasMt37+kZ50Oj9Wz4Q
         dQbg==
X-Gm-Message-State: AOJu0Yznap2wF800jDKvcSBSnh1HVbwNc+Gd3PoU5s8Gs4EwdqJ6EmgS
	/dN0/bDyVUA3iyG/msQY2HzN5i13ViuiEjpYwLHK/JaB0uFD3S/uHShkltbzWs2HVzu6HBngvk2
	aZ9z4TqWtV/4nkvPRt7qAYFbHTWHJdJsfTa+YgHwSioKUOsCXXtPeDMYVaIGWdBjyquMn
X-Gm-Gg: AR+sD10t6vPcK53lIZ/nNxUVnSzoyPdw5bE7kO8S8JsK6HTmbZ07WelIj/qgyQeMORc
	wcolKWXHxBFpQK1O7ccx8G1AzZWp2DVNWMre84jZshJ6DqaQaUwRYlQiFWiJpWTno4oOvrSPjLg
	B81244/oZFg45qQVCJSA/WBj6bbNVhRifpvxb/TUcCkkyC7n5tunPBfqV6fRkDVQSRkotnX1JQr
	ycxSElIcnzQ7e6SMjE82M2TEemM00mTwRvN8z3BD9tbTbCFrG999tnBPLLz8juUn7ufCEE09qPE
	u0+oU3hN9InxnuX37dCw/R05bKdVbnJXDNV+4qsjeM2Pcjc1lCMTUUNC0rjS/7G8yd6uhOJSeQq
	ZGxEK2XuZKvexm8jGAuP5G2+O
X-Received: by 2002:a05:620a:3183:b0:92b:14bc:7936 with SMTP id af79cd13be357-936d22401efmr2316810185a.1.1787044786921;
        Tue, 18 Aug 2026 02:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3183:b0:92b:14bc:7936 with SMTP id af79cd13be357-936d22401efmr2316807885a.1.1787044786560;
        Tue, 18 Aug 2026 02:19:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d859717bsm1569036a12.23.2026.08.18.02.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:19:44 -0700 (PDT)
Message-ID: <f5333c12-7f4e-4a4d-98a1-74d216f6febb@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: pm8005: Add pmic cooling maps
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
References: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfX78bqE9f0hCx/
 CUewOnG0sv8QU5Hn2fDljC+jHJXp35mGrMwWHwNF6un0VkOdPsAtFKvC2z2hc5dhA0yPQdGfXq/
 RzbisAuPSHcOuyIa/1qZJzYVqkqn6RA=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8423b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HEphEbZ9HJbjtYqkmScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KTNgId5I_hRiwbLThLBDlbZ96pzxx70N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfX7ON/d59vvfhV
 8mKXii50oXEWbHaXcJg9HCQIM1/jjrtfNou4ubQMwPTK8AQipqG4MOZgxRiQXSxfq4f1dOnCuNB
 uzadiC7Chhcs0YM84L7nQLSLLqamz3SSG/IVGjc99SQT99uA38dF36MaUI9yaglOdv9LgUqzVSi
 T5Gyvgi5BDU0XHa++14mcuqVsGZEInO69ph7g5Sqyzz2MxSRAwTrQfubSryl9kEYZwIphkxIjLr
 M6mrGms0LOU5bc9QtsnELbI0CrmpfDnt+l2MX95CgFU2aGrOxYb6PGFrznCbywNvkYUMeUbfiof
 gkBO4qX/WoG1QDL3hgpgY9R9ol6f3mSKUwvMxgPYrv+5RYwFCGyZE6TKpwZjg4SMTVHUcDG3vUL
 7mVE5k20XVxYbOUp6vDUp1EVjAma6UyQKyRb/jpfrHRsLzNJ4E0BSDoDc64ELlfEXlZZ9PGqR+n
 AUcyppqdzhQi62EMPtA==
X-Proofpoint-ORIG-GUID: KTNgId5I_hRiwbLThLBDlbZ96pzxx70N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180068

On 8/10/26 7:13 AM, Dipa Ramesh Mantre wrote:
> Add CPU mitigation cooling maps for pm8005 PMIC die temperature.
> Throttle LITTLE (cpu0) and big (cpu3) clusters at 105°C and 125°C
> trip points.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

You're making changes to a shared file with the intent of altering the
behavior of a specific platform. Furthermore, you don't explain how
the CPU frequency correlates to the temperature of the PMIC die, leaving
that to the imagination of the reader.


FYI:

$ rg pm8005.dtsi arch -l | sort
arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
arch/arm64/boot/dts/qcom/msm8998-mtp.dts
arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi

Konrad
