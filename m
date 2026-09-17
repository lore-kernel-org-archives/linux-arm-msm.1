Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B968585960
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658173; cv=none; b=FjRO/p02L4Cc3g4TrXcBZ7rbbVRLpE6u+Q2M/pdSgQ8K8vqTjAZel+l+6siAvYuLvwWWpQ8kv4P6Rwy1t44b93F9YDmKuybRBo9JWFZ6/VKYA058Te3H2D0ysOY+QrEpecogebYV+46ggNUICEUeulsOrWu0IiT/SN7TF0P2tY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658173; c=relaxed/simple;
	bh=mN/y5gkJ1eIeT/23li5ZAE6Vdcj+otr5+S74JJYPlzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYGShIlqqtlhkzig7a04U7BT9S1lfTlVg/LpFNl9UFzEwccW9gyqal3HklsHaGd8OXEylNkYooMhOP5D6eqOBYqZpGuVY5V4H3xYlkeS68tqwUjf6ui2cJRHJ2iJvlEno74/ngKy9uW8UI8btJOXVVBUG6dL+XAS0nZvJ7biQ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4DA+xHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSCnfYMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4DA+xHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSCnfYMX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjDTG1175976
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+s9oHZn49sNcqeY9P4zWOZp
	N1WVw8/WixsEhkKlvqU=; b=Q4DA+xHpdwVH5OiCoVH3SIS4BSvh1opGgyqJnG3B
	2Q8KQjNM6tSXNBeM06SwqG/mihISOkN7+Jda1KHAwZG/hI0lcvKYOjopKSTf6qz6
	GoZDbTtQBSWWM16wP0BHHSLEbqGoCLRfHLbWUZ41aPy2E+sAJZfAq+OsZ4ZsfUEd
	zN/GkFC10sgUApJlx0ulaxb7Ur97xcPvPmyiu/2WZRjciejnwQkrMCJGrlZId3NZ
	8LssZCdBkSS9ggNay4UpYUm8iW/obp+MlIYn5n1WDIOYJe7ctkLCnhnGFx153bXG
	huHY+JVaSbJo+oNPCSSIAFEM03olS1Km/sSP+mi03InhmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0swgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:15:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a00c70d28so165225485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658136; x=1790262936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=ZSCnfYMXhD2xU9UjAThESD2HhbUj30bE3Auj2IDPb9207b1jpXCB9NJDwEpTUNhUfw
         UpknOxgcZ3GRPXIMTcUSkgFH+P1UwzuI58UfIpDiTtxdsoxhGW95AjBKldAd2+/MlhrF
         TT9wB+dQw/Qm519k1R1cWpb4jec4sP7iVxcmoq2IB7HAhb7pXh8nDAq6YAGq9XSVPF14
         GhQt16HBO5f+gComNDwb1u1hbsnzUQE1xAz7cQ3StaLumTH+hfsT5yg82sAQ4VDqBgO9
         IP2In+aMcyaYG7BBsCP+Q/t93/ZVa6Xgj/jq+yuakNuR0keBd1znHHIrYdUeyk1X9GmZ
         8uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658136; x=1790262936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=Z2/8zfRiUUQu1WFot0NiKflje18Ie6wtn3Bdjh6jJAjSXmCSDRWRM/CAsFiibwER/7
         lKmzb2EwRFQz0quHZiz9dATFKqBDeW5SsarPgk4DnzDsfBGZuapQ9EU/cFZ2fZq0q17B
         U0QyGr7b3MxAvwSgZotRIVIHFFZV+E3//ro10NQTeB03h38PtBmtM+7AZFTa33oED34w
         slAvsriDQmUdOfzjbURz856XIVYIUYje4ImurbKa41Xdfhb3zuF99+v973v0aKbSoZtU
         eRbQSTer9JQSDIcnCMtr3GcehYiNcyxR1gu6Y2Joe6mJ7j1NKr6qJYgznvaMHgORGHc3
         icUw==
X-Forwarded-Encrypted: i=1; AKwUvBxzbac3j/WC3AKSg327ri2DiSvEz9Uncx2isevLMKIDc03Puei8BVzUnGAY2QYhB+MLc4hw8NG4+ejeVlia@vger.kernel.org
X-Gm-Message-State: AFuF++mJsiM4ELIJBRx3BlVFn6rHIP7c30pGITdUnh0/AoOKoRqv05Dx
	XPtTnMkxBmlmr0WvwQImpeUZOwyZtIpEQHaReLyvrIh3utQox7XJrhArNiVejFBCis5Z4g02fO4
	Fnk13vz4GlmtMxSlrtZF0UnxTU1/Edfi2x9iwC8+yWeF+en1IEAu/5mk+bQxTqRMA8bBu
X-Gm-Gg: AYBFou1S+BUVii1TsEWfMA7s8hgM78Gfjd6GE5A+u4SycmgtkNEOWUqRhXgqaA2Ee8l
	sJ+fd3ekQhNHOM7bfk7A7MO6uW09zpMeIOMPKn6VOVBvmQOTlRhbTQmZl3be0pZ1UCnIyBrffQ4
	N4756zZ//wdjCSYpeuU10czIdwbPM7KTRCDZbLyoOeJI6CbaQjJ7dWpGmqJFCtBb+xn5TtHCdlS
	IDgS0c21yh03twzeZCequ1V8DOu9EMsYNI27qfcUDLl4jbPTIgs71nnNb3b784c4mP1ESfByXT+
	BU2dc8tAXZSHtsElfqEHEmB4VquzEKFcJH/D42Wda0PLd2BYkO0etO3LQvdBfI4lKxbiGw+GjZI
	YCIaLHtSxn/VeQA==
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110242685a.77.1789658136160;
        Thu, 17 Sep 2026 08:15:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110234085a.77.1789658135590;
        Thu, 17 Sep 2026 08:15:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847e994dsm113950375e9.2.2026.09.17.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lgv4hrhmvgetmiskf2j5rihn2r4rtpzlwnsb6rz6peiqe6t5kn@li5kt3psjw5p>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: diAox80Pt9EyVs-zmwWa7pHO87K6YprR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX2JtfASkqJob7
 abLOf7aUY+MevyHYb6NZnjHYEm2xp9d1ZG+HVZCeuOUWtHHAauMlBUmCwPiVt5XlbZgWaX3NnBb
 g0dl9QeLCV1CFJXDS7qoiuXtC/E7Wb0=
X-Proofpoint-GUID: diAox80Pt9EyVs-zmwWa7pHO87K6YprR
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac0418 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX3vCLA//dFM7o
 FuEiEQGME1KhtYvsw989W3C0ACnEPDJ6p045Y/8bq02feips+kJDb5yZKhZz+6VOyDo+m6VB6as
 jSOupWu0BBMXPOyOzjjjJlwSsTWn2e+iTuAozgyanBzGMB+t9e9hQ/XLvevQn4nF0H6p7H76R8Z
 IcJE95t+ih9aN3Mp3p+KrrVHm6pEdVhN68miGkGj3/My04uP05HJ8U0raKM+cdRNQuhLxEwsGwq
 BORdimaa9gm4wszqLaL8r9Mshm/97dOu4uoRvhxe6RaMQkdFwxYf/sw05S1rouskkqKQ+fItjJz
 VMVT/C0KEgBBZeH4WQblBcCjXrHP2PqzoUa0SkWub1dUEPqLzZ6z2fgosUqkBV+zfIUZ3OsT7Bc
 Psuji3GzdWHpsPv1M5mgM6pf3AReWyF+jlrdYtlv8UzMC+ScN2RHH0bjezdk8b6Z3rRB/YJ2rMQ
 DbOfGif80VZEIRP8O+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:27, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
> nodes to allow board-level overrides. Move perst-gpios/wake-gpios
> from the controller overrides to the respective port nodes in the
> board files, renaming perst-gpios to reset-gpios to match the binding
> used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
