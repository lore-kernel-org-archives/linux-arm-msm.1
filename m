Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8733343BDB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509130; cv=none; b=Gmr+TCzT6Qa0C6NVDGLLMi00Pojks67Q0TCCvrrNf+qfTBttW0at950pUiC+PKwNT2P6Brw7DiGTV2sneZzO6MqFG/VKg88VAZqBkdvSv1VRN7iZkILuOdE2cplZtDRAonOCHUhmR/Al6eme5bW81Ar5UxnhW+9DiH5Ew1u7CuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509130; c=relaxed/simple;
	bh=E7eJRBrZC7S6Dyl1yr3XZTSVgHOfz9ZEHGWqdMcDUsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPPPdjMm1ZOuvVcRrdaf2uU1TD3LZmBCR+lAHUulmZSgKdb6T9PYBfctqPFbZq3WIQTGUaHrt9XZdeCmlDJMi/YNbfxoGJGQzXKQJkMI+BbuNvBpyNd3LUURL/NrWInFP0GmSf1PK7Cs0Ynt+yDIc0vDvY+6sEYkeHXrgffxSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PblENfWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3zH7lvV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PblENfWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3zH7lvV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBebhN188913
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=; b=PblENfWdzolEPPKm
	NaHHVyHcnaaL+p03zGEnFLe20xztcSUywPvQ4QREHQIpXrFcWi9WpxKEK6POmr3x
	qjGDS5VZ6sp8H0STHBjH6eq8opc4Bgu/7TMkzSHzVifE6kG2vC26ve+iSJzf9LMC
	vGTRg8Pb/u95/J6O9l/Tp6Z2wqOVP4uxLssuhqWdziyAqoreqm2zkj0l032aT71M
	pJiLwwkyNvjPij0jr1SN5qhsaOxHbsclWkB/aP6gSH3JNrjeVM3Wt+INcZy8ic/b
	IJ3R+dqIprDJInKKskGfTjKwUsJiqZPaMgAHDgTJr/1SmWMZiYVqVezTbnSX2qzy
	bKjF1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0scd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:45:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so9558331cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785509128; x=1786113928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=;
        b=e3zH7lvVW2nrHGk83yw7B9jdpMJJgsV/ZLbmczoI24dT+8YXCeBPpz0J472cP6HPxe
         fB4GlzZi7x/+pz5R/KLft7NZUu3azudI68U2xQigEItnkSun6b730aBjNmo+pco/rzAu
         ASYa3+TmBR4v1sf4W/RKfBDF3S1Eof3m1qku3cz26K3wHdB6AKNVlrKEVTy+foc7Hxgu
         CBGkg9NnM8Sc5AHgBhdQ1BsV5VZrpq90tLUTXvZ9zAOPCzAfpvhne5WMs2MDYqszvwNq
         LG6L5QOnzrCoOlNYGM0GUpMoovkcr8JdBFun5xKSfTdBpX2tg86xsl5JA8EtzvZq8F/H
         Oucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509128; x=1786113928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUUexB7yi2dILgMSCy1Iht2kViTXKPk+CZkKSkRmhf4=;
        b=GuYkApnK4ma+u1lLgW6OrDqEOmDQ/WfpwgANO/iW4C2kzLhHEeuqleCUA+tN6yCzQQ
         AY9Ayag/DhQkywO3C6OmIUWH/1lZbabFHqDAztNgQndg8iJ4xqEKTjbHa9APtaVCBJ4B
         W9wA+KgipKKAvQVYexOMs2z7Y6Pc+u9I5SkmjVR46jIyXyVEU2mNPcobOKEKeoJGTnSL
         vPzFX6HnVKnyMDz61/1KE9zHcyfI21NMznsgfI1GfdJo/0WK1Ol83ZtXYdPnMwDe9ftd
         Vpbs0PCkKSZoukjpA2rwQEqf72GD9s08Wv0GtDley73tUZxz/No7auym8FvTmGfhAzdN
         08wA==
X-Forwarded-Encrypted: i=1; AHgh+RqLT//pxhlCUPIGZhNKD8xBg99bWC7YACXHHtk8tRbnmD+Zkq6NeF1F95h3VRbKrC7QNBKsH3EOqQeVr4fM@vger.kernel.org
X-Gm-Message-State: AOJu0YzW8JsVeV4JULDGemT4WCupUAqpD/kMsFRdIveBM7y8CTAxRJ+W
	ZTfeDU9v3D3wpXOW5kpl/wdKsaB0yqZWzC9fS+zG5oRgok0J5vATK0bxGtPfLdbdWmEXAZbeu/Z
	yQTDat0CJJYOM6eqsL+d8jg8NyKWSYkoqSX5ukVe55pIwc1Ic6h4mnAZ6NQDf0jaajr0l
X-Gm-Gg: AR+sD12G5KXb63ib078ANK+lsNAkJdN+ineQKQU957d57ZMvP55+Pw5r5FXL2/357RW
	l7NcOF9E3U4YadOcLd//wzHdnBN4U3GHsgetq86dvFhoHOzQOB2eSezy2LzM2iNEQIT3r/Zx1b2
	TfQ+xRdWj6yvWHDsKBOYiwWHwdOBUFk83CGKuBgONNIU9InNpXSXJfq0RaEcXwfbaJ9tQNFsF4m
	ZsSsk9YyprpwfZV8bhOVeprHAM7Y6LiTDSp+LAL9qbN06JkCePsXDb5K+kjaJ+I8HuwFRIhsZeM
	e41QSNyaAdlEYoBWVpkko5Tawgp/c2dJ5dtdFPfN5iIPk/aGE4QgPvAGmC6UlzLSFZi72gAO4n9
	rzoJUiY2HvlMtAJguiheWJeKUbxaLNbSN
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52b5682e980mr7805751cf.26.1785509125550;
        Fri, 31 Jul 2026 07:45:25 -0700 (PDT)
X-Received: by 2002:a05:622a:c84:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52b5682e980mr7801041cf.26.1785509123372;
        Fri, 31 Jul 2026 07:45:23 -0700 (PDT)
Received: from [192.168.1.10] ([122.177.247.168])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e24564d3sm353641e87.71.2026.07.31.07.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:45:22 -0700 (PDT)
Message-ID: <712f8a14-d2a1-4a90-82f9-05cd694f2658@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 20:15:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: bluetooth: qca: add QCC2072
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-1-2d100f30e202@oss.qualcomm.com>
 <20260731-first-righteous-bear-dd72ed@quoll>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <20260731-first-righteous-bear-dd72ed@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6cb508 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wVA5pQU3D6HtJETKl3oCcQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZtkR8tRNVxI1tjOBf7kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX7c9nPB00oc0Q
 +POfACwvBzUIbYzZOJS+GovdvsFKbWtKgk0cNx9UBnzEQ2/EuKfaRdmIClA1GL/N112+TA1LE2U
 vZvJxbdGI6p4Ak1GLvpUvfuq63v1wkgKUTxY7R+FN+vHqD7cgRMuJy0LeAESWHcjd/81odnYjlD
 y8mzKR6IkjEmkDS2j1HzANvMfMTZQio/PNaBRDnScRp3WTKwysDIhijccMxgNe+VigokT9Ez4x3
 ucNxzUM3A39EZbvwMGQuWfW7IuwrBPMYLWJig9Q6hmUWLU94/SK5VeWS8N+Pr1c/t9mf93SAbVm
 vOso/cix9edMwpm0WJm7uAaD3NxZr4FbPc94IYoxViAmNc25SWf0LGbMyGYp0nlJc4sZk/hhEpo
 i+ZIQFEDIk/vAPw1nYSLWJQ++LENiaYfmwD+X1CcuDSWd2iwdWa783dE6UD9SyOl4jzDFXNUHVZ
 J3PyxGqVxl+4A0PmT8A==
X-Proofpoint-GUID: ISAXMH2b7m_deAsIW13s3ICMyVlUBCtT
X-Proofpoint-ORIG-GUID: ISAXMH2b7m_deAsIW13s3ICMyVlUBCtT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX9sVQEFVbUBNg
 YX+LPddx1ZpYwxxVCm8S1IW/2ZEUDkUFbQDMqNx+Q0a358EYPTTKFyLATHA+fVwtJIRPd737Uwy
 0I8HGY4k1qOk4DVwkv2NMy5twiE15IY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112



On 31-07-2026 15:16, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 09:15:01PM +0530, Rahul Samana wrote:
>> QCC2072 can be used on M.2 E-key cards where the card power resources are
>> described by the pcie-m2-e-connector node. In that setup, the M.2 power
>> sequencing provider creates the Bluetooth serdev child after matching the
>> QCC2072 PCI function.
>>
>> Integrated non-M.2 designs need board-specific power resources. Document
>> only the compatible for now and leave those properties to be added with
>> matching driver support.
>>
>> Document the qcom,qcc2072-bt compatible used for QCC2072 Bluetooth
>> controllers connected over UART.
>>
>> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> 
> NAK, exactly same comments as before.
> 
> Nothing got improved, although what is weird - original SoB is gone, so
> this is legally dubious work.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

Thanks for the review.

For the binding contents, I tried to capture the current scope in the binding
description itself. This series supports QCC2072 only as an M.2 E-key card,
where the card power resources are described by the pcie-m2-e-connector node
and the M.2 pwrseq provider creates the Bluetooth serdev child.

The binding also says:

  Integrated non-M.2 designs require board-specific power resources. Those
  properties, together with a static devicetree example, should be added when
  integrated non-M.2 support is added.

We do not currently have an integrated non-M.2 QCC2072 design, so I do not
have board-specific regulator supplies to document for that topology.

Could you please suggest how you would prefer this binding to be handled for
the current M.2-only use case? 

For the authorship concern, I mentioned the earlier QCC2072 contributions in
the cover letter, but I understand that is not sufficient. Since this still
documents the same qcom,qcc2072-bt compatible introduced by the earlier
work, I will carry the earlier authorship / Signed-off-by chain in v3.

Regards,
Rahul

