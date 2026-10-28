Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193636;
	b=J1k4HZeYbnjocMaWLHjG+SihxFdORnUUo0cYFZn/RuOqdbU9fmC7sdHvd2oNcWQc2RIa
	 QOXKAOzl+vZPF63C3fjRcXUi39FqET90fFFNVpq+OMM9mVYod5Vj26rpv8H3g9HniUFLP
	 X41HC72qFc0hXGoUPjQoPL9c5qgBKx3O8OGFV+Yzne0yxTgG6Ez18xi5uy6p00+lKN6KW
	 +EBG4JN9rzDluMmr7Ev2fRij1WATmtWIplldRhSGjo8ktHl5vqihkfBW69shqQaUqKRCq
	 oquYaS61kQE24oykH7DaKrPeLAqE61NJdCz2z5oNOhQrXattoAAB+mLTmiz76okr/yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
	b=YV2p5/KZPkkLIijdmev+yioCYepYJu1fizFiQLfx50dAf9CWVMWmC7NNtd2M2ioVpLoK
	 AMt1GPcRqT7EL5Rsk8bM6G+5eZA+zGHZ5cfbG3Sa/MZ6oUjphNgNEe/JDSvXkWaFsdrqd
	 Ejf2zMcdZSjs7eMHFtnZHRZPOmb8EZJqEvY8cw3tDeE1qSLdXr7dDnGGvpbYTgz0A4uLc
	 cf7yOLzJDv54AIiSxXU0csGksB9gcjKoZFACdRs1wxhaPBWJ6z77Z0PFFVOKwl4e2jhTj
	 mi5cBGgdjjYVacbxZW0+tUikwGavQifQJ7PA/0POjEyaHc8gFo9kWIZ+cYYZEnSNeNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F3606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5BE0rI4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FngDofrG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIH2a3916337
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=; b=N5BE0rI44UcfV1FE
	Y1CPquxLO/iZMblydFhDbdqy6Wm+RDCjygga63UP6OZCRgXRklyhQfR+Jl0rpG1v
	veDMj0CRboY6Y88yCki3DoVpPBuskoL+s/jd/iJVokIBUvZ++DVzx3orDntZXFtJ
	MbpKmEsM+x+WuGzPRxMM2rx7irkpaAdqhJbv4Z6TWZaeUtFfZEWXALkuoXDZRtxV
	xUR5nHlMeJHpOVYO/Mxh+AP3lwkM/KHTbnNgGdE90Blu7IpDcjgiX+um9GpC/l+h
	BqEBo1PefKhrc0lpN5aMI4Bo/VrrWDfkrn2w2OLZYfUpg2f90DS5vIxGT9lKNHCt
	N0i6CA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtng0aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:20:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eb86091358so40654e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193634; x=1793798434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=FngDofrGM/Qt6TwFYzOFjkmc7Io4MWHX5NG55K7POqrcyzCaAupEt3IrlIzg0N3y2B
         K7b2oMB1AXYYsdZywg0uqcuNFFMSqmfs0J3R7/82H/eoeY7oRb9eNvRbMp3NgfCRRzVC
         6iEy1o4d95ITwj+OW99C9NJt2viL7+VKw9puyBvS9LcH9kaJBUzjiQuMU3/ozCaJQwUs
         QXSAXZgCFi6nvnQSLZHk8XmxBEYlElGa5K0RYouuVKhDC+m3UCn4oJ8dNJQXa2L/FIh7
         kwbLRk2L8fSVw2NZWgCokEmGjDW4R6KASKZF40UWyyXz3TEtZ25HN8jyNNsAELEZcPBW
         Ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193634; x=1793798434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLmvna2p5qvHzaxj6u1fu1rYL1SKPSQFsc6X57fBsoA=;
        b=E3AtWH6HB/9rop3BIju/em5DpUpgmvA0C18LhVshPOvmnfZT6mZUG0V1FfYjmL4hml
         XuL3WuEYGJy4y6Lq+J+1RG8j5w+QwvMmo+eoy70PeJxD9Tmzo9DFSkK5jaYPVwfOwNbR
         6+43Jj9D9wL0BbejyjTrvQyhsAPoUzgv3d7s9pGvVaH1FjVomICrmsi5L6XGXX8ivdJl
         eRCNLluT3pHPhnDJrlKocdUl7CSkJ2iiaAuCYqP8H2KzAhNLqeJcz9CxJKYHKQgufb2+
         M8o6DUcC2HrDN6gnvsDPgsj0vijlWDwuVmSezsIM6AjN7NseLpN3y0Si+Wx4FriIMa8p
         MbPQ==
X-Gm-Message-State: AFq9FYLZq+xkDWkY1qcPZ1TpIZ3cjY3broV1hAeHErdPw7TXkyJrJP5D
	Dg9oP0rhQP4fMhE6/C9yt6JfSQO6r4wuLmLD5LT8RL3oHJIYO1uv/uaXQ3hUUOpvfCCIC6bVXPI
	X7sqLjzU/kXOnmyexZBnTtCCFqzl7UankEUzVxIyR/enOYsl1U5EKxJEI6bBmMr3lzPyp
X-Gm-Gg: AYBFou2CDeE3WoPbLBGS37yEu682IHkJh4rTWGBddwwJF8uO2T2BXeL0UbNFH61CKjO
	sAwmhq0CfDbVLg+piDiMI+/7vlOJGaQTF2jN/aAzUKoKMP2gqk8aWfF8zLymdXMxhf1tbN88CkH
	KVQB1mAIQTEmZMnYoybYrwyM64Ad+M9Ay0uw3d0LNZFV2LJC9j3QS7WeUqz3W2Sb0Q7IeoeK7U3
	qJxk0cd2t1vQ23pWdrN11fuCNVVnZednzJ9yK+IYQoch1igVyuXiFuGR9YJ49vk+0/gaclXwWBC
	DikXjhAkzpgpM4Uf6EmBFHZqLq2fa8bsieOlObHO3TQWsjzy+e/UaAFAclumj5TcXtKy3/wYPHn
	2oWlZR2Rqo72PTnF3PI+mj+3G6UjBRzL47BT/6KnFaEq5BwXISSQJ1hQAgL63azqiKHKHxIE=
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805399e0c.1.1793193634010;
        Wed, 28 Oct 2026 06:20:34 -0700 (PDT)
X-Received: by 2002:a05:6122:1a8a:b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec4caa71bdmr805377e0c.1.1793193633498;
        Wed, 28 Oct 2026 06:20:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57dc11sm590055e87.33.2026.10.28.06.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:20:32 -0700 (PDT)
Message-ID: <fc444b2d-9bc6-43b0-9054-ba04c7820352@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:20:29 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org
References: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: He4nocdDikog0w2vYOoUZswToA2C-PpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX/hR4CvQYrwGy
 dFDKe+oEOZd20bJPe4BVKPy+rzs5ypWYBg2xm/rAbYGyemgTmgG4zS2AbyB4zjl0I/dumWr/IUa
 MREPp/FcmykJ+LcPElyITX/swGVLu3GOI27fxjdviDBDgPxQZcXSRtnbRfkFTudiN+F98jc7Wm0
 Hao4QdzZAr3COsHkrU9LkXZujQps3eyMDJ8WxdLdIHuP2nnYQE4j8+urqerJkssdrJ7TmrcPm36
 QDxUons1rG1PghegglZgf8EL6pbYfwurVqZ6C+s9h/z6e0InAF9mXPWe9+swaXJ1jEJ8LvcdkJr
 z58wxRyUIGO6JXzu8ghlBXkefLMowDsva+GzTRS2QnCS0Vy7bAekD93amZV+IuMukuOjuudnxQf
 JVyPAvzG+5Bmh/ddMEkBDC9jLK4An2i6PqTnNlRHpNfqRqP2iAVWVx50bCkJ3bxjHzkSOmaGakl
 bZqeEs2hOGqnUVkoenQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae1f6a3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WKNOtjYE1B8OkmgEoC0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: He4nocdDikog0w2vYOoUZswToA2C-PpA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX05Nth59E8A1R
 qNj8AWKdfZI0r5LuES9f6MEl04J/8lu+hfBssDFW2UKm++77nm3JcqEkhchyz6Suz4W8T/3Y02Q
 xyA2TwIHP/Zu4B98BLhRF3FLu2Srpn0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/28/26 2:14 PM, Monish Chunara wrote:
> The SD card detect signal is active low and requires a defined high
> level when no card is inserted. With the GPIO bias disabled, the
> card-detect input can be left floating and result in spurious
> interrupts.
> 
> Enable the internal pull-up on the SD card detect GPIO to keep the
> signal at a defined level when the card is absent and avoid spurious
> card-detect interrupts.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Fixes: 51fe74e44c69 ("arm64: dts: qcom: glymur-crd: Enable SD card")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
