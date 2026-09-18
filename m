Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904334B95DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726008; cv=none; b=iXzh8AcQF3wVje+4chwuki/zo9JaTjs5koDAd9NlOYEEAlJN/pimi722nm8aUiOXPu4F/ZQkjvZj85ZaYJMLwRWVsJRqcECbeP52ZoFnlv20oBEJq9qvj+hMRRTh30nkVfu0f27y9jNZ1s9nYtHHr2eoU3TY1/qUFKMgKhCHlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726008; c=relaxed/simple;
	bh=xLJMw5VUo0mVjCzcec/GKVtU22XKIreQS8drxGreApc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhgruMTMLreGKD3gosFNPfpev2Z7Lst0iuz/CfAP4ofnorMKQ+M/W4SYcUeGjkk7KGvs2MOKi3bA/tcvmcoUZ5RuqznYK7aH4C3TCjWTJEzCyF+KO13V7UYJR9JAt40FaF4VPfFiRAlkR2qkVVGroZ12cgQLWqjZCN+Ud+x2NRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xoy538PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+/FOaWo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoy538PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+/FOaWo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dwUn139383
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=; b=Xoy538PEU7uNsmgg
	oCJfKkZxR8+t7Hy0R9dsgbBU+6DNHaqcjUwgplVtmq+7Bx1rInK03020q5Pf5FMR
	67LE5aYHHsf03MLUz7+xcibnyWHAIcNwdwGOWM4o/MngyZfBSmdM4mKOG90Q73Tk
	wFUPcuFkq6ibeoVeA9lmxKPp2o61+uW0kFFX6A9i2/IC394NWhomFluJRMVI5GNG
	Qj/zcLQ4dtwUrkhX5wBzm7IzzCa3wZp5SsRYMGN8cfNB6BHg3NUmvSaBTfL0qPZx
	BiQGuDcypp/kJit8RHrBhhmYL1ygY50rLEU9CIAbTt6CIKIIl4Qtqn7adcbi0mRB
	ddnH0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bs4gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:06:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso12344785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725998; x=1790330798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=C+/FOaWoJbrvOl7VkSVaWKqz0TJXEXwV+Q6MgeuA8XWIlcw4XdI0iiFiV7VLUziHkn
         3CazZmYfkktTVd34LYCMg4s4CAwGeafm/Y/EVe4+QHApREi+xUDjNFgUgQ008PTVDQfB
         sAuiV7bzeXqqQjqwVWDXROxd+qrGy+7+U51/za7BUrhom245Cvfd3uv8Jcy69ZiwnGBQ
         +l0aUmjdL06WA6yOxGqne4Tkutrfm0O+BhJ0niiUNT8CGhuLZ5jPQsz3G1fn0iV2dc/u
         /zZQDpW5nr9ameBLtytm/9nEx4y9Z96NDQuU5HGN4arEmf74CtdHp6AmuiPcWeEcq8r1
         w3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725998; x=1790330798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=bO3EXL6aZf9GNDWikVcVT5LtYK6UhqYWT/WdZzEEiC4Kno7yhHyoSO0n9/lTS+oK1h
         H9EQryj6QbnsCSebEmVGO4tlJxMJLCgtQ9Jm+Od+Ryb+wRzyjfcPOFM6oQySaNpLFlb+
         92sS9quED5pVOyo3pO+WTQlvwkXmCPhoYHO8Tr5OpG6mVTCohK68TRdVVcjdHcfkxf8z
         lwt8Jkzd7B9hVZ8UmIYbrzPe5GNo1ymF657jSXLVHrUFsmMEmAHUYe44oWd1oRR2IklK
         LrHTBluVp+uvqyR1KAMacWZdQfaeBN81y0eAGkOgcdMXMb2zNT1LhJr7b4BfEmwWUFdR
         /Gjw==
X-Gm-Message-State: AFuF++l2EWWg+PNfaRs8W0poTA6HP2ql0z/7xK6B8xM08DJkZuqCxAAo
	PfHIs7eFpiHD1GM/s+BZCzbqx+77gL28c6Djob3N6XJb/7Dptxq5wPbvXDLoVBlHO9syzM+HQt7
	pGMxLL1z9chiREuav/kKMW2PQyqCJuczcDjkpDFROuWyH5Qv7VrX9GpSd9n4v2VeK1+0b
X-Gm-Gg: AYBFou3L9joGVJtBeNe7uXnplfkQKl9aJ5qLPnsUj7gvg2t6L5V/4jr9IJe82fK86m7
	eBvZXYWFydIAmMVdHC8eql2+dR1eA4vr/e3sy6wzGdCUbFkmaZTb8sjs+8ONoS1F2pULerK3Wek
	oDyR1ul78Yjpt+Vn8c/kCUsfgPz56p4EbOmnzyP+mRa4+4eYoght+Ni4WHZsIJIS9COk1jLbkkk
	KbA72F/vD/4zkPpBhlFrsD0CNZbK9qaGGbHKkPnI/xKfXj3Hx0T4gmFhHS/YLV4pz8U11Y10jU2
	pM9d6HngiTUyitv+oXR22jeBlfkcuraKU1+gnH2hoGJ7uMbUPU8QRZJx8h5E/sGOsV46av0O2ds
	omvfRCushJDdm2BttrkiOJA==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185227785a.3.1789725997714;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185224485a.3.1789725997331;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08182sm40158566b.15.2026.09.18.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:36 -0700 (PDT)
Message-ID: <9858713b-031a-4b91-85df-4f3854079b91@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX5q1gfneypTFR
 +MEeAa16TeoTmLfiEC4TVAVuPFk6ZISb5FFG+gNPjz2zoxqo9d7FNh+VU/vjJ7P6N7quAgJIBhY
 2uOvFfZ1nImZYjEPDVhtEmFG7q4urvyu6DDSgWPxx/tPzD47JrdkNoJhaCCL/GhpDTnz7Vll3L6
 DfD/uR61L0MESENOw6faX0yJVDrOfVI/rUTT5ZIxNzG/ScMUBX2NapsaeOUmM1UJV0+jOHN1QuH
 dBA2s1nAXYArxYxTkDF6v+Vrhzr1JoU7Colt33O33Fab3bmD+93KSSmjk/s5nFiR8RdachZMzVq
 wPZiOzwpaud3oaVVEqgrHXyHTZn04GcM/21hGub4txenQwzs+nJaVr0l3ktozBtNDiG/Ah3YGmb
 A9awmiK8PT9TirRA/4x5/x2hr5TiQByTaXkZfAb1jU7jfhyMza3Fi9qhbmmLA9uV1JGsQ93NCcD
 WCG9Wi+wuCKNAwfFO5A==
X-Proofpoint-GUID: 48JhoGWLBeYWTHH_iH71icG1SgU8lIBz
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad0d2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX2DJaO4Sshb+i
 8ECHOORueNyrv6xvSeOYY472/IeGjV4W+G4U2Vr47tQpNkij2YGOWIT3XsCNhA3SyGfNvhUjLN/
 hBAl6OxDx1tN6J7ZhZxb2vSOqlXYiqU=
X-Proofpoint-ORIG-GUID: 48JhoGWLBeYWTHH_iH71icG1SgU8lIBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
