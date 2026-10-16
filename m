Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8F4908C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146739; cv=none; b=tgN89cJl14dy2XdceknEygD8KT77zpGukrR1S9Qchqa4gYMxjHe+b+N7x9No704r/DItAgfL62e4+2CWSSBWQrEnoS4Vkz2f3PMZNHvle5bAJTGKj7gEmZIYtJYCJMbaEPeyyLVzLhsIUI7HSAYfRUjO+QO0eNjs4c/QETH+U58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146739; c=relaxed/simple;
	bh=wtfh54+DbmEj2kpdAFEn5f6ixXFIwBqvnu9+EMWfQfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFA1iGXEeCZWsOjV8vPxpk9x7yOpGLihg05jB17MwQsYURj+uqrcPhpvmeZG1tpLuKM0Vqgcwen/LtGW4rJsRJtq54F1diUh9cfAExZPL2vEiJQyEgtRmVME7uV1gHB58F8TmVCebacc4ukWQHxMJ8+DgJI9DVNKQSxH2AhuX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1dIizFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvAsSYdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1dIizFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvAsSYdw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA2Sj942577
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=; b=Y1dIizFQg6x/OSgW
	ouvIVBBqm2tjGhJOtuUNMidOMkRl0kr9IwpHPhCGXgKfzBd/+CLjKT1P18k0GmtU
	VgT0ZK3EFQumR3JHlW1zCw3XYAXuQzFk5Zn1xkiRTtR5hgUnvLsH1NH130PaLhxO
	hAhllreCQ+OHfM8Y6KT8hnd8A8cMqCAP+tCgPyM9AMTCd9KHLp1zjgabk0LSwyPV
	SanWOjEJHbRS6wgumk4WA+BvmX5o4fyFY4CciLMEfTy2othcFfR/2Kjn7lFBJtV4
	XzlfWSuJtxR242Umdw4nt/NH7iH+ysGXUM9OjFE7vobBX7yrPpuHITlytav9dE0W
	VKUKAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur03ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:32:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so99057385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146736; x=1792751536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=;
        b=RvAsSYdwM15sZR9sUGbUxoP62RiGTBr1cR1ZSSCjSgFet75lQX6Na9eJp7ZhOBV68I
         qxpJKmNsIUmY+wYPVj88/dGJpqtmGTl1dV2canmlmCm1oodWLIjA/HBzb+Jlcz4gaIbD
         Ds1+ZcnA/YKK12rvzryEGS779W02dPz0kApR+b6pzg6KkMgITT7tjY0KPNL5ZwH3XS6I
         wpM0JZ1R/fhjdumndU2kYWApwtWbwct9XmERuyq3pcoys7g+nGN36caKj+WKyivKd2t6
         RqFCxMxTcJYhcJeBR50HTxt3knm67WpwepDclg6SLQFWuy/bvstvUXDf73Y9PBtrYmGT
         fClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146736; x=1792751536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=;
        b=osxUmdEAUObdj55ooSL1ZqrgeKQ6HPA1od0Bq19/BBAnDEXKqplxcueKe6tjvTtH3u
         cG1xes4hS9BvLNpvgc4AZMQSsYttT2PJbldQs3Mge6ngUo65GiR61381bzusJpl5dUv2
         rIraTwfCiHZsxoiIlPipFAfbKCFR5j5yLpse1n9R8AiSYt1LZD6lx+CU5eveVCfT/7TK
         sma7MohQQM4I4vXPo7cx/aJ4Cx42xAilSjN5uVdEUd4kV1IS+GS92rX2EtEzyiU6ZXAS
         NInnLBpu72uFUVfrEJDtS4Cbjci8Y5po5tiZ6lnYsqh/mY0bvo/VfhSSwlagx5uZOUpW
         dCLQ==
X-Gm-Message-State: AFq9FYIMWMD8xouXiUdAqbgcB7LOwLUnUUYgil/oQUH7lddmACpfsExm
	V5+SKeLbOAQSlSjMIfBAgbxVZXe0GPrKjX6OdaRv/DVnNITkXH5bCBjqKqY62votHkW7ZdcBPto
	6yRj/f/28nFIX5ogzMSYkwYsHViOEtnDBISxJExZs6TTM1BMskzTV042hXX0/LEVrA9Jn
X-Gm-Gg: AYBFou2BXzbxyiVZYlrqXocb09L5jrJdWkA8cphHBclEIkmOUf67jAH9MS26nG4LA1t
	9BIWMYaY2MiOfpkjlHeL+FNzuUO6SmQ5rumBJQwHOyOCzOT+QSO12O9DlH0tia/fSQQG+HR6iTg
	NsQa8xLL335gfgS4v+wKzbnXpOWhSYq0yvCq8WVd5IqIyh3mA/URsjoZ4flCb8NKBo6zkcPOuCi
	nG9eqvau+f6OHwPInZKIZHlBi5UtHoVxflDJ/xxzST8yxjxPec7XBfeKteytYMN6bCLk106hGX5
	Xyasj9eTnMVEzd8f/E4Eww5AX10ztwpCeFPPRyJlHKMxgJPDDG5MzUuxV22JzrT6Sg4+mGOqmyO
	XcYrQiR42cw+NGtTVe4R9XQ==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr4306682885a.3.1792146736349;
        Fri, 16 Oct 2026 03:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr4306678185a.3.1792146735822;
        Fri, 16 Oct 2026 03:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03a5sm58202066b.58.2026.10.16.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:32:14 -0700 (PDT)
Message-ID: <21aac057-68fe-4a63-a1e1-15770830d7dc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX6siOC4iCzD/V
 P8+PkBkNXWUYWEGta8Y7gM5FbB1M1rl/6/fgjyo+AK/4aTqcHWHshx7I/fuOTkQpwI0oQW+wAKB
 fD9C8CNWoMVkdCsItzQXz23Q9XgldVVen6F91QNL4sQahV0hKbRA7+dxN0QSF5JQ1djLGWSKtED
 aHmNc/H7p+HNWrIBCjyyAmlWwjcaFs8pEGaJ+xEBYyO4CHjrw2xpk+kAqOlOZCKFuQSc4OItb9X
 n0lBdKhNmcS2nowDm7ghBjDPBdSMeFFA7j1YOORxxLMHYeuOmXzgl07gN+/HoKxelzQXdw32rVg
 oyAmmbzAIedeKMlrO4eh9t2RVahBEQBHtrCz++eiChdfnb7CSaDGCEzejDUtNGA254wZgcq33o+
 3FLc8X+RbeJXRWMfEjmFWa6bX9QNvS+outhTeTInRvnNHSEwPubsOi8s2G4fulrhn8BM0iQa1vm
 KpKZw9US5qLNlpNao4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX2O7taZjwWSNT
 Xicr30M0rVJ+hYEsubgb3aTO7hyx21B6tXcpymciMbec9ufBz49wjO4+bfQl8u3zX36i7gUvzvy
 xnvNphYWpRAdTBfVOL68hQNxV2ec55U=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad1fd31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tDyJeIcYhq5IDt4aaUMiH6r1zTs3D9Vt
X-Proofpoint-GUID: tDyJeIcYhq5IDt4aaUMiH6r1zTs3D9Vt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> Currently the PCIe controller is not programming the T_POWER_ON value,
> which can result in improper L1.2 exit behavior. Add the
> t-power-on-us property to the PCIe root ports so that this value is
> correctly programmed during host initialization.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index f2da3706d5c8..54acc7d9bdea 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +
> +				t-power-on-us = <80>;

nit: please put it there in all patches:

@@ -2316,6 +2316,8 @@ pcie0_port: pcie@0 {
 
                                phys = <&pcie0_phy>;
 
+                               t-power-on-us = <80>;
+
                                #address-cells = <3>;
                                #size-cells = <2>;
                                ranges;

and re-run the list of SoCs that need it (LLM should do at least
the first part for you in ~20 seconds)

Konrad
