Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243A4DDB45
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658033; cv=none; b=Nk/ne28wNWG9aCMasHTxHQA40UwUr3Dz8RhRasXgUki6qicRjLVkdDK+pfsD4x89dn7EVEk+bsiXEN9GK7hYIRMm3ZH+unL2xR7kJH7Gx12bDDaEsPyCCrrmOlvO9Ot4Tzm6CQVdDfPIluHlqzEitett0fanM2JuoFPcpal/x0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658033; c=relaxed/simple;
	bh=qFqitZAPT7YhE+SzfbmQSBcXIJW7TK5WRemWM3eNHHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvNiDivDdoIknMC3i8HRRTA0+UIFhG5qkbpXqzjT3C1YA4x+pR7rJVw9Z7B15Qn0Se1DU1F1T0dZe6aDUHaTPDlDTxBJvYrde1tn0PpBpmMsPMgJnzn4LUN6MUOz1c/KK7fw3CxduIVL2wVrXVC2GwL/1e3Pd88xk/ndGyXrI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPCEIVq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAgxsBh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPCEIVq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAgxsBh3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkG6d1714741
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pKE3Tw6s1Tx+aDoJccQ1dDP7
	DWWwIncglgNtIuBy5L4=; b=nPCEIVq06zDTvtEKw9oYcaisOM0brMAxXQGhHsT6
	v6+sy2xobFHx+eRP2UdOcBOJMj+HIOQkFeu37YEKyOJ7i4LrVSiAAkgQVLQENfMQ
	prEwpKnC05XK6QLnFwsd+Ms6SuMAa23CJvuasCV36J+SN6s74nKqQccW52bC+Afu
	QcbyqpL4moXsFjWYUll4ni0f5ePwmn7E0Zn2ykZJTNrArtCSo1JX2fY2NrgVUUlB
	vbgP9YgZdmer27gmQpcwKAlokf8viwLn0Q5Z6hLFtlLQaLIXe7q6UrXVJK5kH5Bo
	BCePkI0NAd8vyfKqCIrdMARJy+6AFKkGg8kP0P2xiP/NDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w9ug0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:13:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so280145485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658017; x=1790262817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKE3Tw6s1Tx+aDoJccQ1dDP7DWWwIncglgNtIuBy5L4=;
        b=kAgxsBh38C+uqenfDBm5IPIjlmd0zB3bymhUDhmXw6jxdaWGdqUk7Qc0o8yegHY9CX
         8k5FCE2MFGuvc09DMFS5zAeKFH16Fh6Z2EzR/0XhVoYyYhBLdZ8AhwESYRZmYkP4785r
         s2RPoCx0zkzlKpmNwUdYOyrWulMoBIZUolMg/FTaLRpvKmqF8aipSHx4oWDFkrvk+Tp+
         yuu7pla8/1zuKiRQwtCpZqoJwRc9G0UPQZENzaFehRDgZEUVXIqxR3zreumfc++WBVM3
         tl9bZFCTW/gK3lo98bt701jY/CwmZm3hXEFKJxubgf+FmxLPTV+4t+XMkAggg1s3m6hA
         J+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658017; x=1790262817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKE3Tw6s1Tx+aDoJccQ1dDP7DWWwIncglgNtIuBy5L4=;
        b=U3gTZFAccJqa6k5wSLbxfzO2X7nFpRvNSQEJCPn+VQGfscHygRs/gS6tKZxjdHqbYx
         nqDG2U3ejWUKx+sa0UtEb7+fuqs/8R9kfQw6tu8/neDNP9peQA5b/ibv8ryyN57IQzHG
         CjMzVymZs7YJgwHu04OVp91ih6edHZcLDZM4L9d6ij9FWKUmji/wOWlet8X6gI7BH3L7
         JkKtWOxBPZU736GLMFkWXlCyT4UQSwU3FVoVy2SWfiN6gHf315RRXcRWn4caPOCG9PCv
         3gwjIi0oNA82B+adZ9ZTnmWyQsCx8BwpR0ITwuzzNaexdn1+1jnfFt0EI7bXBEjiqQ84
         3nmg==
X-Forwarded-Encrypted: i=1; AKwUvBzt+//2tflLm5OErLy3jp4L2whwBAk9pv956GMs7rkMcrcBwCSJ3Lbrco2V7C4uQ9dSzzMfkNEeSSyW3NcO@vger.kernel.org
X-Gm-Message-State: AFuF++m+0L0mmB35kdf8idy1oexP9a4+1EBUrMeg33tk/EkJLwhR6cGB
	2fBn0tRwRlaRMXgTNiru3kR5OiJ+LNOpoPjcQZU7I5TGkbA8FcfspR9BI80xq2GKNof4KDQB29r
	ITwWKrbnLWsc0yxFrO10hadtFpjyK6Zz74FSGUwTKoenM5n9+vSG1EV4La/kid8MXaqQ9
X-Gm-Gg: AYBFou2sZ8zeiIYIQ2QvWcxGt7EP7whVYLJMGw8TBnX58X0Fg71Oc7iaaoBib73xpZP
	2PjY8d7nCxcvnIlT3bTqeHe0vuLPt/lTxB4JP/YLLo2Yt+9NH7ELb5A7vaGcmPs7x2GunzZ6qgP
	wiz3ed6tOfaEnccY8505fcrrzYnTv1/z7S4RVw/jcf2K8TM23NA8Fplz+ctrQSDsNuW8+95feho
	cJZ05y1F27lXMkiYLNxtEoS11/VVACMnKG6M3oed2iX5MRjnNlIUOGreuwsfEhNmx1Az8d8ijDG
	1L4JXqsG2batNPwzI/SJEnfit05XuT+aM372iUnvFdHFLkmGsHy7hK9Hj+x32vGPKAZm1Z9F3+g
	X94N0GOPbESfoFDg=
X-Received: by 2002:a05:620a:890d:b0:937:50b6:4a5b with SMTP id af79cd13be357-93bb7764653mr1099287285a.23.1789658017315;
        Thu, 17 Sep 2026 08:13:37 -0700 (PDT)
X-Received: by 2002:a05:620a:890d:b0:937:50b6:4a5b with SMTP id af79cd13be357-93bb7764653mr1099282985a.23.1789658016703;
        Thu, 17 Sep 2026 08:13:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847e994dsm113837995e9.2.2026.09.17.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:35 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] arm64: dts: qcom: sdm845: Move PCIe phy and
 GPIOs to root port node
Message-ID: <7nh6b2w2clecaqfjm4zcyqng77dfx3cavv3xfeqyoziukrktcf@xnldmtruq5da>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-6-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX8m3OiK76M+1R
 NgmiwB27RgJcGu0C+Vabs2+CzoTdy23Xe7W7VX6x2mt9oaTMX0HItGJ/L9ru3PTsth4QptsJ+WM
 t67PZDwxHj460U2SHY1O/NTfc6fu4eluk/2cgcTKTdGZld+lJxQIhm0AHJATAiJrNHM1L47vQ2W
 Wu9j15FCHLvEqEHg7kfh9gG6V05TBIYeekchZj3Wm70vPreiVvU/YPfBy+e1ymCGnTyxDTgA3oz
 uenmeGVzSPRlq6gvBWQGurRpL+hL6dY19BMgYJbUWaVbJkLg+MiTLmR6pBYKF7O2Xkhz+dwK9G7
 P8Wxif8gDrKCmb5F3bEz/bSaNtxBnaNtBPZ0/8y/xpQdvR+N9kA6UG0/fCVGjqBdqTAAl335zEs
 yXXMTwQoCWOzumrLcujYKQiwqjHFErCQNAHQQPmrQYsNGfPTdvkcb3SMN0HmFRhYDp+vWL+ZiMi
 LMM8mR1sJ1yyOUBYH+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfX3F3yzzfBVL+u
 236wDp7LJqIPxCX/aplSRlf7KSEj3yXF1XLO+vWHCHC0wmyUR6VWJg3Ns07IRItAVMit4ES4tl2
 44EDKMMykRfrJF7G3gP/2te2+H9xuSk=
X-Proofpoint-GUID: waNNhcH-RtzsUaS1C9gSgpy5uNU6LE3k
X-Proofpoint-ORIG-GUID: waNNhcH-RtzsUaS1C9gSgpy5uNU6LE3k
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aac03a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:20, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
