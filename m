Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E93DA5C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651607; cv=none; b=NzNfYtk3iyS9BI+yo7ENmiOuDAvWlixEhgwaUhiitj0c7QSMMuYr7Z3sScOmDbd9TEbWQfG+Om/IEN+5XlYLGuO2DCgxzLcB64s6rSStEUpL0gYHKTGJQdVTlFqKPZ3UwM3xRvOGErgeU2mC1HdlYkBYzlTYRSgWPoCPEbBWc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651607; c=relaxed/simple;
	bh=l5X6ihKbm+gmWczFyqZudpJABTmGS7exPIXHaJYGFxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuopRlbV+1XdKMYR2aCFdO8snZYFYFlAkxyM36JK/Ps6yz/Kse6TKhnrnAXD5chZW7HhcbJ9ZKmjvvEv224YPPsAjaVzc4D9pmhR/33OGQ3oAdm/2rJf6tlmUFw4fo5xEUrNYJvx+B8PPZPv3PF/vReKg7oM8A82ofKRx6eGt7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niYAYoXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcZ4BFda; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niYAYoXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcZ4BFda"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88LHk297641
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=; b=niYAYoXO9OStFEvY
	oBLMZ2QFwuwv5XNwvZQqTgg0YG8OO8tCsdwxy4j41blGlmYO4etpQcG6ehQdOSxM
	SAG616GbzRA3/qiZjhC6yUUaX7FBZTBKjtIAI7CFWqtFEsjFmJssx+7TL3E2haT9
	rKLH8l4zNw1+yIHi5J8byyT+1dy43RKvku/z6MsOgsB0LwgKwyWwgDWMYjPjKz39
	aDxGPV/vVRNALTEDheriZVSFwNn75pAedj6KOqZG6I9co+tSdf+O1LSZ5zgOKesX
	M9EA3BaTVxHwX8soSfBIlcos3xAuzbMQVnVxxNKmwHHawUmp8L7mcbi1TtRnaW/s
	1uE9gQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxs8s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 09:53:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so8695631cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651605; x=1788256405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=;
        b=YcZ4BFdax4Uc+1Vv4CWjxKw4ftbI0lNQ/6+WPcwW7A8Car2fcl8y1os7vi02BLgP6p
         oO6M6/yU7s671E1Zup2WnaeJJncGc/gCey12wA5HvRoIOv3o8ML8ki41EJ3gGbcyBLB7
         1r8lxLad+6geAdE91p7A0suay93/hkptDAvZuZh7gYE7cvQ4RPoKSoWK4n0akjMazUT0
         NliYELc413fedIFLfgiOUv5Fmu/hWH2aLugOFNF2HELB3FMQVq7CMCxhBqc5FwZEn1DI
         +8iz7RQ86XSN1XirTiGNWSOhuzkXFKgzUBRE6mqG+frsYq4biAumEt4w+lc0FzLePvqu
         K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651605; x=1788256405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=;
        b=ZGOioTBfJ6Hq+P6/MYDcHeO4QtNdy31N8ooPJsqgenBrzkcT0K6M40BIjxXK3ku5A8
         lTGWuTiTrWrHcC4X00cmq/XuzEVjkn4+aphSxeDYw73si72FassbcWodpXSWn+kJBnWS
         SpiSX+CP+rC21JaczpAwW1ROqE9xWazq9wk0ZGtLD2fLe+meF1CFjP2Dv7k6rE43QtvE
         TTtpm4IWO4p+SostIyhsfRT7WIugTA9ZCa50HCWQtw7oPEnS6KY3wW/nzYbQZ81LtCuc
         uDASIeFkWULLMYKHMmmgy9Rw9SVF5PKuulnmMBmg56IQiyO3E70NtRtt2q70nTesqn9K
         GGEQ==
X-Gm-Message-State: AFuF++lfVdjP45cyet+aF6p83+zSDA4OtlqV6IT6jd7niN17FFLP5RnF
	X/V85hSo4qTF3myE/xn0Z82GEjgJFVygYGFN5IEI8bo8H9+AFsrMzu3DK6/JKgHFU60YxH4Ej91
	s5Lz5Xv4TfMPeI79FZ2CGEIZ6w8+liGgXIE2oOr1DM6lBMmiRoR7YpKOFtViZizxn1QcC
X-Gm-Gg: AR+sD13zxuZCGJkigX1q8gQAhetCulnRLUcO4QpmXB9e0/PNa+LgYiQvnjP3/qlSVbs
	R1SNYInM1dI555YvHyGuIVLZPeIb2GbXoW+kXYyYSby44juhqEXMvCP8I4FWYDQLY0uKII3knRp
	03RX+Rd0arbYCEi//P2jTqSPVispQVFidNyXtE9EVxHvu5y8i2RxxLFRFSnG7cEyxPiuOwdto9s
	dD9+iWKPMDAr7CoFovuYt20fFKQTsF6ujawGyJvjklIlFwAmug3FaPAMdi6TcwOJWmp/kiLh4kp
	P3Ub83etW2cQcLvAVKJ8rdjExkiELZSJbKBa9prOKBXjfLF/Vpt0lZCz7W+aeiOf8jBLQPORrVW
	ERv/Avkk7fmFV3DjFZbwaLfmO
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr238711231cf.0.1787651604765;
        Tue, 25 Aug 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr238710981cf.0.1787651604251;
        Tue, 25 Aug 2026 02:53:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1923235166b.12.2026.08.25.02.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:53:23 -0700 (PDT)
Message-ID: <150c1500-4d78-4350-9ce9-407615a08312@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MyBTYWx0ZWRfX6bA6zQzJv5io
 vXVy9PamgecrJp8UFeTogG+srF+nE+CnkNkSJJhF8l0/aFi1BGO9hUi75DvtLXcWFoFNGI0SGLL
 ieTVu942oTWidd9Yh9hx6eJnrBZh0mE=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8d6615 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: -yIsWdsTUbzp54Pg0WH9X3eD4T4LYm_y
X-Proofpoint-ORIG-GUID: -yIsWdsTUbzp54Pg0WH9X3eD4T4LYm_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MyBTYWx0ZWRfXwKkfbo/mZgP0
 sPVOzWGtiYdd25RSjAvuurRD3E9I23Z7fJMSK0rb6WvKoqNBNyFEC3ERp54bJIIWRj3eoCUEiaQ
 SkLGJIM12hHKR9/Oxf6AMOr7HYl6clHuAPyjfcuRRvtMH3XVsSEzBzPapvAD4aqO8VMbtSEVKmi
 hI6bU4aU2HFEpciyo9Ry8zz0d1/EuDuMpN7g2mncgqTUP45xXp+8iyYXtR9IWynzpSR54eT5fa5
 VLgB0Dhv2IMGFDrZYVRrr2OZ90H9yPAdsNN8qFgRwo3+7N0j7dfTxxnQ82oEHXcmgSBkFj6BBVB
 NxBFuJ0h43RACClcbck05WqUbZsmTeoNaeEUKP958Y1hyc248nkViWCXfJgNJkmu2WzL2tsdOx5
 MHlCCQCIs2csMxU8Ye2RHU5W/xi1Fl8MY7TpHvdEbdV95IippsvNpJjNESmADbpdY3Tjk5qhWag
 pvvPeoiQvH4E2TsRy1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250083

On 8/1/26 8:22 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
