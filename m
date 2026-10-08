Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60C44AB9B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456502; cv=none; b=slIxr1YNrW9REEfpl33ZlEe1a/E6df/7Cwwv/R52Ot4NDSHNiMP48fANs8sl0/kWfZPbOql0YFZWJO43enypJZ6VCPgA6BUG3ncw2Eet3lrQ4QpmP1yyd1S4oYT9aUWoYKu2JTjBD7R6l6wbfiwrJkZWYn9fXXSRbp/FWre8V3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456502; c=relaxed/simple;
	bh=MRWYbGRMA3UVleoP7G/ToJ1bM42+0FfIhPOGUDo5LYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pbha35EZa+kaTqwI9I+JDvpAirsjffwW5mTb9J2F4IflZZLEMIia8LHNHq8rH4enyP71wf86q6FRzlpUgjLza25XGKgOLkwzz4YqoND++lv/EYAy8BvcJr2L8jT/hOCE+dRuCPyNR/0bnl1iir6ftlI3sUDZkrAsgHRjomdnZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/Jksd7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8hTp/hq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/Jksd7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8hTp/hq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbMsi3129076
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIe2IgU/kimMed/aKEcmuC6/
	F5VtbmEysuL1bs6SM04=; b=m/Jksd7wA71JMLA+vMNBSXnajwlkJCBcyVWZ0RJw
	dzo4SpPpNspfL+kaYbYJNL/tWaKLuR0G8Cq2KLXFZWMZ1NmcttKdJwZA6zNiF4DI
	tHMXj1vQODfvlXQFfWtpoXOfFaWxI2R4hlLZqcu5ndZwYw1OnX1ApZToMRZdz7R7
	KwlqKdbQiN948R16fQjcGNmnyFFE18/aU0O9OjLwszDy2T6zbrln4arwvEukoGFR
	NObKYwdFZm4V9HLcmcWtYOZdmdeml0f+O8PwpJrRZGw3xjfuyk24VxEwPcjmnWus
	Rmvy5oqPaZ+c0LTBPwC5WbjXNs66fKgPCdbE5JQ7iQVVTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42j33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:48:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc5f70c8dso582215885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791456497; x=1792061297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=O8hTp/hqP1Q3q/DujBrx5xB88faKfbRiCjLiry9Koj0cINFv8x+FS+ItX6BfRo1S7w
         ZfjKpfUg3lj3caRB/kW+s7+vvsgVc+YxS47wetM1hH+Q0hJiZip63Lqn5Pf2HWvV0Nbs
         CujAbAKemqUUMrW9teCyHSr3gVdOOu8mffUbizKh0RCQ/XqP8dVkJqxmo/NcR/2b+I/F
         bDMIyIKKT9Kg0RRmznRkOHyAUodvKUVjkKPx73ArhGYaAeGZwqkpqNi4fjebxbE8srSs
         Ki2Sa/2/Oqpk2Qo27RwTTDB4MFsNza4z2B+RCDLzAXJstzOnkD3sLX17OdMPpNLICzcV
         pbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456497; x=1792061297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIe2IgU/kimMed/aKEcmuC6/F5VtbmEysuL1bs6SM04=;
        b=TFRc0P28Lt/cDFRodsdKkDP841s7B7HN/I0AJNkSJRtXVTJKXZ+joHELF19EzZtmhw
         vab+aKQ2YFX3Kj0K8hpX45g+HQtQFbkfJIjHuy6hhYeplkyINM+kW0oLtPA5H+2I0QLp
         j/1UOIAr/AeNusM8Sle0ELg/AhNjw+aZ+Q6kr32pSeWz22jxAMMAD5zCJtx5thM4xnxW
         u1HJydSPsmo9sxIZyPV7g06OIQvA5I4JaMXTip9RSTpDJ/aW6Nzt50XcgG7MlOTVFhRt
         Iv/g5G1JwSM4mmV45GaaB8VdEoLnLn+DR9c0tJM6TPYNgencECzYz9n6fRWcopkcWv4w
         rDnA==
X-Forwarded-Encrypted: i=1; AKwUvBzcJj8cPPKSp+G361RM5xV2fd+88hK6lJhfKCL6rN2WqfgtBqnzOxcVJ0pyFTm6YA7CLZcWtSs1MZ27oJud@vger.kernel.org
X-Gm-Message-State: AFuF++k/aU7YiZeDFMb7N1JFALX5ocnblGaTYUqzrubYJzQVd5wbd5tv
	XWZ5upYbRZNTI4WQzWQefHpybJXZ5hp1GQ0e9W/dqCRB/W5J2Bo/ZMc/Gbe/70p/dz7U+6ADwRL
	XcxvYm8Mw19F3fljzXYfGQLvc46mjsPotcISd2M8v4UEMIkJMvxp6BjMM/tXXP5iHB697
X-Gm-Gg: AYBFou3UcG1g0iV/77Y4dsf5+vD+2rTd6j6LVC3FEJMCF+MQ1a8JwZGCmuwObA0ztO0
	i30H6h+XWOd3Z9+PP0foSvqv+vnFHFsLZbfKdXtt313UTDG3Fof55qiHUJuwACWQbxqwmdnNyk6
	EESXqLc4OXa4rOHdZMP1LFo+G6Y2C3ZcYcwGjZGoNUIPMp1qJnoSDOF3wUTN2nqMG4pqsxRiriy
	ObTJuu/7teIfn+w9bEQFT2kuqhOybPB7B1ZUEqTctB0kuEIs505NxKf0rJxOwpVgkA8tk9bl+TR
	ujsHP/C9BODTP7sKdOyIoH22zWP8c82MzwcFR0BIXXtbQYWKqVbRK3NGIbA9X+NmZ1+z4L/sGbr
	1PZOkT8Yo2YrEr91/jZ+E6ZQXN6kkK069MQuY1j6ZM0+SU+utKAf41bmNseTgKtlxTCRGPxUH7q
	svkeeaGxW1DxM5
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846195285a.12.1791456496930;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93e9b2ea33fmr846192185a.12.1791456496373;
        Thu, 08 Oct 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30a2414sm1086537e87.78.2026.10.08.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:48:14 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:48:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Message-ID: <ldt3pvb45iwedogcmcilcfcwkgntkqragakh2qxsfpk7jz4bw4@zc5yi2i3cuhe>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
 <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
X-Proofpoint-GUID: rh1QzbC_Uei4m95TW4BFdsLlbRPsJBYC
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac774f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qsMvIBxTQZfwbozelBgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfXwLL/28LTq8YC
 Mv0pxbXvJKf7MOwtH4Zgonjeqi/AI+PT2+A9ec0GXQL1rVmJq8+98Kf7ki2nFGAJSWMfoWL5cg9
 ud5ECqZzvpSgn9AEIkFNMY+FGfacutY=
X-Proofpoint-ORIG-GUID: rh1QzbC_Uei4m95TW4BFdsLlbRPsJBYC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MiBTYWx0ZWRfXz+fKyMvWPYRJ
 sg0XYLBCBiM1Z+9Es6DsQNefP1OePdM6eSftta4k+WSPRy7bDZyyt5dbAsRxv2GDjJwjzKJXDmY
 58SYBu/qQcH17pXSqNXsaLqAE9VcAzOyOQCXxqR4SPmluZdb6dob3cxXA8GCU2KpV75mpUNCbe6
 uC22U9ElpjicL+OWzpf7Y4j2bhCxheYcYUI5Gj2D0Tr1fpxcMqI24JG3fhoWX9lQ/FW3EadYHuA
 51LEvV6oF62yzuS69zgq8ZEu3kHvyQrHlPxcalxYUGWMHHB/jHC4pbBv5/rl3ANM5JySdZLL9Z3
 BQ1Hay2dbeIgYhU7JXB5Ojwj5kzp+FkWmEdL/CSPk//EffEl7x+u+1kdQRLYtIMY5vDLWMnvDgA
 sZ4dDGlVHPL2b/5/PPYa/3A52XDwWFMLyRYUJz8gqvDq+3NHtbsH9TqbNv2vIk1gDY/MSpavCQ3
 MSYDSYH7dWkh2Qo7k/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080042

On Thu, Oct 08, 2026 at 02:44:22PM +0530, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> and include it in variant specific DTS file.
> 
> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Please don't mix refactoring and the actual changes in a single patch.
Please split this into two patches.

> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  14 +-
>  3 files changed, 218 insertions(+), 71 deletions(-)
> 

-- 
With best wishes
Dmitry
