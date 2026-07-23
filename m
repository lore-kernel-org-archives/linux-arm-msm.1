Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF73B6C1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807966; cv=none; b=GOFmQr36zxddaxLIMogFEd1ts30a+O2pfKTsfZNEXaOzBWIClt+sVYYl2mz+I0MbcEtqmdn7D5Aq1MdVUNKNNKk5voLehGWUyMHkaxreEBXzKNBSKnybAoslhsX7trwjZ7MjRcGik9QT4PPMtOdY+cAlDClxgfT5RGa+8Y1OlBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807966; c=relaxed/simple;
	bh=3gJPSuw6oM9oPQIFwhRhyxCkwDU9gyPzcFA5x00a/R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fecvw9Nr1rv1vjZhdMmpDWPENrMWWKF4+uHHe/VKMDXZ+/TycBYEehmx9JaEWHWWbrh7QIYiqtfIZniuwOQy0eiDFLkUM7nXIcKDprp2iGn1NRpqN3/c3BgnXJA6SxGcFpMfee/TLXcyq0K1w8oS2drifU7Um2t5emBaJgc9gsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVpfVMmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwIkYi4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVpfVMmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwIkYi4D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qh3J3387917
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=; b=dVpfVMmmYR6dtJgV
	Ke4evHMQsIYsuxiCMaHFCTSErtNpjY64mvdRqiyJcwuSMNyLRLvJbj1LNbJ8pO4t
	fqaJnGeP9Ow6FRI5WqqNiZZKgBbEbb0PmjtPpaw8DnK2KxYWqmwPUY5EoOGS5IKy
	Gzfebe3tNyCtdIAvFVvrUIEwK9Sm6YyXW20eAoRqOUabuDYexniietkmzw9h1YoN
	2d7AB3/MjKGcOwfk4GrVXdPFCI2ql+jUXUp93A2MqzE7svdz0fHMgIlIBgBWo0ex
	aEUkfRuA5ldWdpMYr04ybj42Y57/JdzbtjzQtbA5BB3bvG2e/p0yCxyQCNS35Xwp
	LlLsFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275kxws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:59:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so1989681cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807962; x=1785412762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=MwIkYi4D6XvAWAdwvI6K3cnoWtrpercMwMYO4b0DU3q3iWKzIwwYE8gsANHVv3/W8F
         qqFzfQbaTKUoiKdUgOflgxkJeFCEexT55Ariv6nw0sGAPRVQg2y/hdeQuWhQMhZ9SYUr
         UzBiRJGTeONf68EyF3qUtdRyx/8om7kue6S0uxiWBrSbUvrwqTMQyQI9SsrJ+KaBiV+5
         UmmdyWtuSz1spvavy9aAKA64gL1Rf+8AxcY9miRUInd4mMSm8K7zNCIh6jmfhJEPoxFI
         iTsGLEmAb6pAuuNWw40UBDLIPXSuu7K/0FTHdlICdxL/hkgfbBr6koYYUm5iSf2w8nm0
         MRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807962; x=1785412762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMMYVZ1IXrKPNAdTTbF5kFfOPzwty3ytq98RGOAUxms=;
        b=AtnY7JFSIZlRJzgynZH2D8f/rW9uKLbmU8qKX2PKLQDGcECUHxqn73TPTEosg1nptp
         a/9tcNRmVGEdJlqgf7S1LP8PqO9pNlM/HYKkFWUPngUhtwvdn0Apv+u/7NvZcO7owGaZ
         Kqr/WDthZr7cStgaGferA/C+ktFSxl2fJKgLLPOva/ultk37/yo+Hx1IMxjoTxFXO4W2
         41BttmVsfS1xzukbrk+lAih2su6Os1z80kKBVSt/hjl2IOsUeQjDMpS1dQthN0fBbMXZ
         HYpl3ae0TSbmNPHtd8PToTXpsQUbmuQ3eRAR+sPH8FPtvTa7tm5Pc3JCU0taBWcAok7N
         M7mw==
X-Forwarded-Encrypted: i=1; AHgh+RoRwfqEmb7Ln8xtHVWf8rpRPwHYwlyAsxdQNfwwA2SSPpz+DUnwR/muMr+NNtaMxWLJ1CEyP/WyHtZAzD4Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSfzCP8E3I6/yjbdstoQrpC0GujzcJTmQE9V3wtCv34q7X4QO
	ehZvxtwVXz/TGN6Hafg5u80TsaFyXvvy+bcFqnuuNi8hR3A9W/6lX28PvCdsgvOo5+wzFnnZ7+H
	xeudX5IlCiZWQLNIdt9CPaZ6ouI6pB+tziTy/oWwjAWQfZOLlkmma4tMoWjzmVpY0vmdY
X-Gm-Gg: AR+sD13kLxoNjlPzHZD5DCG4Xp4AgKOOxG8S7p85NEKKMUeZ7AuyZQFixj1hUoA4Z79
	YdCq8K8y3tI/MuJDPi0lfgJOUz4HQw+si4oh9WT5MmKDYUgdsShgg3bWJkZvodlMqTxJrN5z+Nu
	2DEKeNgR6qtTeRoYIhpBzdhIkjY7DrgEHE/xmceXQzDBTgymgPwsAMmJzwc/1B0osQIGBEqu/jJ
	HEtjA+lcy6Z3kCPnSlgySJ3qDLPVJyvIiOAMYUkDutJO1rm6+Hh5cSkWK9aYzthBwtfg9oTyXum
	XnJu188T2ohPEZi9wTMLeaiAkEFmA495V+lCKQBwy2MLwlx5iLQkaNoRal+pI6yBR0oUN0DjrcB
	V6988peg+Hii7ef2wko1EvPKW
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1498031cf.11.1784807961517;
        Thu, 23 Jul 2026 04:59:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-52847442628mr1497861cf.11.1784807960972;
        Thu, 23 Jul 2026 04:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm221176266b.56.2026.07.23.04.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 04:59:19 -0700 (PDT)
Message-ID: <97950bd5-3eb7-414f-9eeb-1b19427b5ae8@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 13:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: smd-rpm: add MSM8920 support
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723012415.48288-3-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a62021a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=DhTvykhhAAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8 a=SV-ve9HlrmyFCwFSF2kA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfXyDrOEYbD6lBd
 fL9FoWxTnISRiaKCFbO0jCtcimZKOWDtp4j0nwZlc8GK0PCBiDpY2jgT2ALkbxka/WNyN7SYcXn
 EvkIu4mYzpXd+dS8a5vrFKAzGV/yg9U=
X-Proofpoint-GUID: lK5HqZJa_usQ938hizrgreGJLu-7lOJn
X-Proofpoint-ORIG-GUID: lK5HqZJa_usQ938hizrgreGJLu-7lOJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX8PmCpItMScEl
 PDNfO8MfEDphD8mhdW0VqiyXGWCUK6tMILFC6Ib/KuLoEjXgoBbbh9M7ird9vLkGHdRDivwliyZ
 kO0GvlK3oaV12mpGTy9JC90LShbRr0HGlp/9NJt9tAXwcvrpid21qrwLZt02wCoqf7VRC/Z3WYA
 atFyy49FwfugIeW3lW9XJaUWAeEExAmCkt6wp40W1NBACftBlLEU/2ze1Sv6PmUlwhqvTw0+4Gr
 wO8uod47eQA/4eAn2JI+fLN9f9OcImxgIorfsL2d620C6zCj8LE3d/HM0SvY9/FJppec78BKCma
 2/EVVP1xeSH7tqEhKENsPQX6gsbnj7UeOfHcjj8ML+hpk27gf6Q0++owLnLzxg7KbZJI70841MT
 /MKyoJCJxHpKNvOcgEWVwE7BdNBnslaWB0KZX0Jii/l+qNRXBIABlCzFv45nBxDBYH/tmQl7xdo
 HKeJl2wZ+P96dfFmXdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230118

On 7/23/26 3:24 AM, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> MSM8920 is essentially MSM8917 with MSM8953's modem stack, which adds an
> IPA (IP Accelerator) block. Add an msm8920 RPM clock table mirroring
> msm8917's plus the IPA and IPA_A clocks, and register the
> "qcom,rpmcc-msm8920" compatible.
> 
> Split out from the combined MSM8920 change so the shared clk-smd-rpm
> driver can be reviewed and land via linux-arm-msm independently of the
> device tree, as requested in review.
> 
> Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
> [aneesh: split rpmcc out of the SoC dtsi commit for upstream-first review]
> Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
