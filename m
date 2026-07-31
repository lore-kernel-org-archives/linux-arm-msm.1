Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429E3E7625
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498875; cv=none; b=SHEX8Qkg6pp36dlot7gSK3zVRjFEwWPeWqKUfY8lyhgwZpyC4pi+nGSc35sGWjMzRfYRGQ9Mhn5VCUB9PBlWXn98DVTOVuECaW5f423yXAZAU2EgdvJxpmKYCZgOWItIufSvu+gX6aRlrMmyILo4MvQ+mG9SMuDn+NBORWTksEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498875; c=relaxed/simple;
	bh=tFtDhGcs3oKho/T/AgVJXutZcqQ3ppyIobZIA9jogeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e78FT4JrCoPYGmvfg8gmNZse2/rySkcwMoWeMxm9ZjflPoWWTpoZ91Uvz32bOpEZot5OV9XaY1umdG1OdJeG+crlO5AC1bOYrXjsL2Uitj476UWZT8cafsuKdjdbQ+uZhM48TGnxLFmjFCttDaY5W18PBAbd9Cnx65tIhRjsX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIVT4+wL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPgvouzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIVT4+wL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPgvouzU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBei7s892090
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W8NamFsvdE5+Gq8i0UVWQjN8
	PeSnapqIvw6cDDIG+JY=; b=VIVT4+wL+SOUoYGZEz/ScuH0PzAR3d9cdNnMKMo+
	wmimrHxZYxtJRubprq//1hRkohqEltFZx997NXH3xa0KmsorkFjwIRyJg8+4DtqK
	HJT3nZy+rmAYAKLX82ZLWwZjqL5lVUys1SYWRhqF0IaJUw88AZRq7EBAQYSC68/r
	dw+Q2qsLdqcFGYpE8fCrFzdhZtQF9cwFSWm/E3ZlZI5pax1sbtyX+xPqdzWNC3FE
	NnG8an4cQjdfg3vnj27WlswsVpVJuoYAkJXA6eUrAtE+ZDqbhA0fwV2JMQmn1u/L
	82E3buHPAzsipmXqVznAuc2JuSXTWprjBIKvd/ZoeLVJSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x81ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:54:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so8938471cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498872; x=1786103672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8NamFsvdE5+Gq8i0UVWQjN8PeSnapqIvw6cDDIG+JY=;
        b=IPgvouzUvdsbxtjL5BIFiJd5Ww6xjbuOltRkI11UZpCL9QxMkQ2JvGWUAfUQz8Uffw
         ti1M93iGzRTHSuXKok/aiN3Eu6LnIm7C22T0t6+enEn0rUdmnQG9qviIdSnphJEpAkcW
         iHJAHi062m6uZVIaUjQo+AO21zeDM8CyK0L/MNmlYjRjwx0KQgdRgbzBKwLKymeGVYkx
         VgV1vcnUkax7ei25jIPQw0XZAuJRkhrak01SxfxCgXqb/12BkzRFjbvsb9pMSAIOlADx
         isVvwgfeJFD2rQ+1xe94KVMQ9zH8t9ruUnfHLtqnrIx9N/vurOcQYW7ov+hfAYvSc/qe
         9Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498872; x=1786103672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8NamFsvdE5+Gq8i0UVWQjN8PeSnapqIvw6cDDIG+JY=;
        b=McBPAMLnlc9x7U0Sy8/zG2hSmKNdvtPtpYGl473NY2bhyvgq1bQbbWAL213rVlllm2
         w/zsSxbObCBjq1KD0DM9lC8QK21nNC57M57HOtD+NJa01NJ07qwZr3dFCey8hpVN3xYL
         CjIGomG23WAQLCYP4gbIe0qaW9K4KCn5XRx81x9rZytHEltJj1frN+p6vOXGvax5NNHg
         RpMF9L7S87ZLzmKp6aFZUfllg9ezEEbjpOtfDeiTbWnpqGZLJX5wpienPkrZl4pWxtKb
         Vsx6q7OXxM4jey9g5CAR0rbyZzt0eblY15aDikdemPVd7d5YcIgH7/B9IJbOugyzcOvK
         Iyjg==
X-Forwarded-Encrypted: i=1; AHgh+RpaQMwm+gZjwIHiM47RkIzsEKDqfu65Xbn5J1yviZwhvUPYAhS2U9L/d11QAHgJcOacbf1QxG9zBzdSJjY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBqCfE2XnEqdRxa1oNZkyS5G9IM6mtWx5tmBeTmcVWaWrplVn
	9PQQprdta0Om6wOvTxTWilYvCNMj0C2eGscLesEfPyf6UdtS5yezTnOrVR0HcBLbJeJSAz2Z2uv
	+iyjhwUNkjAasAouzqn8YqDZ1nqc7DcIgUzvJNWJH1JbvYphzjXFLQla2szOZ5/nfMiJx
X-Gm-Gg: AR+sD12m8w7gj1tbeUxu66UgLP6UHKiybSrqIcq7jscTidVa6yDIMHh00TayduaMH5x
	xj9WTVW4aRijs/jpPvmMMyNLP5AVjZy3hzBwmov3GTW7qByfw6Fr2ybNkWnGCjdBMzjOmZBfWD+
	hq8NxnPLaGTGwxWahGYfmTszMtMat5UmCYw0m6JvcRCCoBYtdOvND2rBD877XjWUn/xxN58ugtg
	OcSzmw8/Ck8oqyw99FAJWFm4AvkELbncP0R4Wn07cNIoSQU1H7XWDFJjaU91Jhit56bzqad0hDW
	2SL/Pz4nSFTsIPnshFmYVQsdBavVCen2bmrTDgAOgBAjfMqyo3obeIP4gSJMne51WiYLEdQ5jSf
	93t6ZUPVoQG3iZOQ=
X-Received: by 2002:a05:622a:2282:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b4afdfe93mr23862101cf.6.1785498872126;
        Fri, 31 Jul 2026 04:54:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b4afdfe93mr23861581cf.6.1785498871455;
        Fri, 31 Jul 2026 04:54:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm4418730f8f.30.2026.07.31.04.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:54:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:54:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound
 card support with WSA8845 and DMIC
Message-ID: <b7uh5ehsq4q3axphrtvew6xiyba7bary6ebmxfoozkgj3axoc2@cjwqcygoap7j>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
 <20260731084032.3106477-3-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731084032.3106477-3-ravi.hothi@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX3kZRrHxSpg/N
 Ze+L2Eg2s7O245SpHU0KCQm4fL4wXoKJjmokDm007+7CrigeyYJQK+wVWPY4w0KRDRF33qzCpt6
 YdgaFxpYxGxqoWiwnrGKC+Ea3WZF9nY=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6c8cf9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i1AF-yj2SoNdfRuAw8sA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX6Y/7olc68Agt
 dLFvo/9RvtSjjYPJRWlr2HoQXO2fAA627zpb27rECHBZnLkbnnGK2XNdMnIBd1xZZP8zEL4PBTe
 RCfXNrpXEBguhVpq7T9CE7tu+mpNExl+E4q3R1nOUlznfhBv9RotdhVYtn4zcZGpIrTHz5DBVGV
 17lLtwR3JS6awVieqrCmn9R3j++RO3GqOWlDbpkSZrHa9z+axupZYctL1z9XWNwBRgsqS5GxJf0
 5XqV6ZmvwQqD2UCTVv5Ria7V/xYd94uNrhKeK5AvdpLkcJusZCTAkvF/5idDZkpi77uuvjVQ0XX
 atTiiWUumIjxG6XIJIXfi8RhOOP4fj0DrHjyyh/SRbVZ7uKkFYT6X/9MtrlQ1FELu9sxjn7FpJj
 6iR4Vrf4rO3CpjubbvbnpXOOBr2pvc3ejr0czT9jB6AuQfuoN2kVx2/tuKegf3p/krPoF5haGhC
 LzGxQEjX1mPdWfkeOvA==
X-Proofpoint-ORIG-GUID: x5o38d2xkC44mP4VjtT-FSXjLJh2eFuc
X-Proofpoint-GUID: x5o38d2xkC44mP4VjtT-FSXjLJh2eFuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 26-07-31 14:10:32, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
> 
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
