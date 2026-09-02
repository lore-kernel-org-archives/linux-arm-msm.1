Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510647DD77
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364722; cv=none; b=sNh03Yl+Aeb7A+Ns8/DobfQ1+4l0HGG3wN+Sz5509F7N+0NjpvVumEVpBZQBJ0JmHEB00gURuXQKax2eNKVxzgI9oW08MGYcIqQcbG1bXe1aadufpnR0IrBd/Xc99b1Y2J3A2VeAquD0qR9T/Pjxjd+2A2Zy41tgzGWZe2oTmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364722; c=relaxed/simple;
	bh=lwm6jSNbiO6LZzYLxybW8K+lAptA9OdyeL+wXz5Haqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cika0E8XxKvuBABHA2fF8rHtDRZzY+20xwgCFQ7kZ2VfRdy/vvejpv19iAL8Cq3gL/JALfvsd4LDAnxW1ViZs7ltBDE/WEc+ZkTpPjTZ3OzD1LAFIsefbEZVb7VHgoM3nWxjvUCNAjCmJSyKwX4HUGZflkuAQoSkdvXVM7icZso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0o06vvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxqY5ztF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0o06vvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxqY5ztF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ4pw1284808
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=; b=f0o06vvWiYYW4k0B
	x8yxMht7qboOuruBR1QI8ZqNZ89BhK2FgeLQWItmX/mvkfR3Ph6zKVc5wmzZafb7
	tejjztWgvzjFzkxrQs2UlCg2dINhF/HAsLAOP6lL6BtqUQxQ+O23Ulskx47I67KP
	x4y+Cqh/rdhd3CvwlkbvynmUFSoA7i/+4pUVs+QwXS7p2M6tYBIWBsn3dTrD1l0B
	4jNMH4ZF02A/GZg1BL14C1ztUpW0TnE2/3GfmeasSp3iG5i4hHpX5Nb7gI1Ei2s9
	Bv/sNn7fK/DSGvhtYFMZnEB2D5WADtBGSAlWsbiUolgtTaSmOaoMpy/IGSftyqKW
	rzq1iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb00ny4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:58:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso29512985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364719; x=1788969519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=;
        b=TxqY5ztFr0nbrIJvJGnjP22/xTXBpB8XkI0pbcxcw6gqHlgQ0GI41OSc7eXo+cS0gB
         tWMToahKLND4a+m8Kk6HbDJhBNLNWL0IsUOhvmiI+zMhGJeepgpYdMGj02P0jvytkAuQ
         HV/NwUXHq8j8CjF3NQeqqCeV9nFDvfTgSx7N6qHP+CoVsn4sL10rVXaSsVQa0PbwJP57
         T2eiyLx3No5zzrodj6uA+L9srRfitR4mjM8sICw9Elx2Nacnd0S52pkx4g3qehEByzcS
         DvLprJpXG5A02J/aI/TZTioCXQBi+9pTyDnlP3H/fqxr4XJSN75dwvLrmoFpen3o5TOl
         kogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364719; x=1788969519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WT4vDkQPrtgRr5nF277OBdLIuA4Vcdh4zy8bVUfvfeE=;
        b=WzyWxvQospZ6cT4PKeYWppobiPC7d4LGUwU/WXZzsAZU49aLcFB0W6ZCtagxW2M5OW
         YOo/rN7+yRVDyDXuASXOtnzaNFH2Ow/OVC2kfw0On3kkJHDaPF/xua9SXs84yOiN9Ajl
         TSapok6/RXYrQ1sXcI8CaJLzygNhFzahXNwzhpp4FV41XkLVnlg3KuC8CsYuUZq7a2fZ
         PqDgk+1PQQshmhoMG+XwrLIhbG1PqRyDWtcsTCRsG8IcYz0su1UNs0yd0aCpGKFxBA9A
         Y7KfeVfUyfewV4vPBt2SO4N8lGWVoF/fqNbsaMecL1GqAee4mhkFTwfd2kiZgTxTzgFl
         oFIw==
X-Forwarded-Encrypted: i=1; AHgh+RrBtUNr67tO8FIU7vziXPSBSY6m9x+AjWGpaqvchStu9p6WEE+3AihwEMUjLAUdGdtJRw90c7DH2K+jkEg8@vger.kernel.org
X-Gm-Message-State: AFuF++n5sgx/nLThchcTvaz+z4WrqSfsMzyMMxpv99mVhQ7PJfqCAFgv
	LvPvUmY6i7RlJmdDxtPP6A4rVf3S3J4isB4Qf8alvrBVCB+EWovw9XMCnkRc8hgYIGDVzesv50d
	3m9Wzk42flaql28GTeW0mZg0HTzT/lcjXAz/7Izc4kuZs6GkHGWiQM9iOfKZXUNdkCCJc
X-Gm-Gg: AR+sD11zleB9rn9u2xJ5LYWQuSHKPQARsVwGJ2i2R1AVwV0D2BpswyB8RV8XQrp88NA
	kYReFnbGw/owDXxFHfWPFfY93u2LEzLU7wum26vA9dUz6H/KhFP0GtYRSupTq9V1tB8LWNVC5N/
	dTCKPSnVsQWiLJZfBSGP4Q2sCIiRPE6p5ZGWIVxXTAnCWsr16/v8irDuemG8SIn8dTra2+bbBSo
	xBwDDW3Be6DsWMJ69kDwRTKJbyVhXvGyj0GAPzcoQJ5EEKIegTxSe+Xf5DxsU36qiJOA07KiQ2E
	LU5NTfP3aIb+0Z9FFu/JO2HXMgOgubYUy+P3PGvTxM2dBaF9pPfkz1ihHT/yPSzt6y89uBrmLAm
	tt478xGNPrqkT6bQaEm6GIA==
X-Received: by 2002:a05:620a:1790:b0:939:2884:e11 with SMTP id af79cd13be357-9396108b065mr451123885a.5.1788364714444;
        Wed, 02 Sep 2026 08:58:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1790:b0:939:2884:e11 with SMTP id af79cd13be357-9396108b065mr451116785a.5.1788364713865;
        Wed, 02 Sep 2026 08:58:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d044d776sm159586866b.62.2026.09.02.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:58:33 -0700 (PDT)
Message-ID: <245eb766-e35b-4f73-a252-69eda60011a2@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
 <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
 <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sjU5EgMvod4pIg9hJTLDiEyZUn9vj9Pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MSBTYWx0ZWRfX6Ngc6+1FKn1N
 2UB9X78BGzbVvbpkfN6mf8NZpej1pz0M77bRyvoDpu3rgAjk91lYJfW7sXvR9ocZCDfwEsN20fN
 o2MA+SLtS3bw52uzenvZzJET1MQkdEV0NKtaFz01ONBdI7Syds+VBEjtkwvNhw1dfPJBMA01QZy
 u2SMrv32pXE+3jmA5qhgRrB72LjKoFiSRdN/4clEX1i1MuJo/0GWPCznupvTKI5s8GukOk830kd
 hSKX9J0JtWOJM6RFzF6F5tJcqLY7LdhQ0r/bmSSPBJeLEfM+1jzO5DiBieop+t/SwI4ZLCXYs5O
 4Wqhy0eEaOh06iJD0nmaQcP3bgwU1SkakbbvcsdZ4oGeR4oZGLa9/apjfm3zqkuQtqvS6DcCH0N
 0ssqf/MQAQjHyDRHS73F8e1oZ4oF1HiVLe+OaBR0B6h9CRztHIc4nqCPIIqfvUQU1Ki9xwWfOa3
 OlHwpF/WK+pipMnO+nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MSBTYWx0ZWRfXz9D7U9xE4xcO
 JBx+trr3oS0FrFFj6XdzrCnt9tV/J7ZG1Y4fREXwyIc175iQ3HSGHIJe8HSzcRe+UHsKnsbqOFc
 QHZxlsN1+JTtzw8Y5S/S4bJblGleoLU=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a9847b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hKkCCEgSrQTGbmuQoJcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: sjU5EgMvod4pIg9hJTLDiEyZUn9vj9Pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020141

On 9/1/26 8:41 AM, Imran Shaik wrote:
> 
> 
> On 27-07-2026 08:14 pm, Konrad Dybcio wrote:
>> On 7/27/26 4:11 PM, Imran Shaik wrote:
>>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>>> SoCs.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>>>               status = "disabled";
>>>           };
>>>   +        tscss@1c80000 {
>>> +            compatible = "qcom,lemans-tscss";
>>> +            reg = <0x0 0x01c80000 0x0 0x2000>;
>>> +            reg-names = "tsc";
>>> +            clocks = <&gcc GCC_TSCSS_AHB_CLK>,
>>> +                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>>> +            clock-names = "ahb", "cntr";
>>> +            assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>>> +            assigned-clock-rates = <15625000>;
>>
>> I'm guessing this will only ever require a single rate - do we
>> need power-domains pointing to one of the RPMHPDs and a
>> required-opps reference to match?
>>
> 
> The power-domains/required-opps are not really required here, as this
> clock's rate is at the lowest corner on the CX rail, which is always
> kept ON.

The clock plan calls for SVS_L1, the RPMHPD node also defines SVS,
LOW_SVS and MIN_SVS below it

Konrad
