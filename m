Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE23438A0
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312822; cv=none; b=uyGEOB/+56f8RBL6BoSCEgUI/uDJNc0y8lMdY01aqcYKfBRzqpnDgWGl3oxkeibq7MdQ2iKZTkGEWT7F3+eBHsKl1vQ3B0JJBN6zbTgTfmWmwURRu3ZReNLgwgV+telpeAF9Y7lGFCfuUxjlweUW2tdiCj6JctjvR5jgA9dBQPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312822; c=relaxed/simple;
	bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5CaUgMopp7Cibg8WiBV+Osh64p/KUxaUP/YEQl8cC98wOBO97UjcrA6o7xhzlr4vZU4X0BzqhLA2jP1wlRSYQjugF0LiclLfaHhcQjt4eK0eP2lIuHxGYQzzzzXd00gSRLUR33RhJVneZytMdVgMGt/xkZrtndPNQrKnVStPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXUdYpRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTc14yDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXUdYpRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTc14yDV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE03sB1251446
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=; b=UXUdYpRwymBhpkca
	0NdA6NdoWFF89CdeqIkpAQywZyfpkF9as8Ev1Vu/t7wmec+YDYbVVYvsgTt7uk9z
	58+Sram/KpKxxPnIUCBe+04SN0yudkAx+9jxQ6CYiP+HG5K6jeJx3A2lhkitPPKX
	VWEHkfdk7Thoo40SQFDalCdDMCrtlTM2h8Co9QynU+6HeIVYlCMxzfM9QW/4h02b
	3qhf+FRCDlxAIiliZ1tG7r0gs6Tfq3p8FU0w+Tu/MhiRtG0ToUmhT8KgjyrhP3lL
	9FXHnd73IFTMKrTyJjpTqPOIdwVLYrkMiVLSfLTqrPWgHyeR8d2FbICFmgTRbHTm
	gsM31Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbgf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:20:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2436978a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789312819; x=1789917619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=RTc14yDVaCHcKb8Vx2XqODh9J30JLFXKA9rFhjlbof8mIEjrL8rf5rcsVbBSQfHctI
         AgO/BNG+jqBf4sVAprUjZe3KMVFaMIlN+/bT9hlJIi5mhCtJQ0NrKNSyTfsFEf8A0FT/
         dpW5gKfKZiHE3OlP+JEd7XYJUi9bWjSPM/jO9FZXMSxuGr6GKfcHzM9uSyTjnAmYLtvS
         AnfrtRV+GZcgYMAZ6idcfnf5WacAom/tBuaIBCpuUDlBkMj1HIpPLKspbBWdc8ZRj06s
         9ugX57bTh/vhV4Jzuxdb/BpcF9vRCcmGYJ41mZuR9l/PzbVIjjakdszijdbkSEGQAl9X
         VM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312819; x=1789917619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=JXnODd627/7AU9y2OMhh5Qs43u6tA7pwO1UPA1X5mKMJrY7TumZposUQgofe6Phlkr
         iZTIgeUH8Y/eriAcJBo0kfT7Oo1X4k+zqvp6dNuy1IZCQBv3hlQs07zeWPKdXB6Mq58P
         lr7L23L6W5LxKAkHrRQuHJTgNg6cGJSdxkcYeA4Mdiy/sXRWFC+hh4HAhPR2HIPdH6YE
         jZLjjDnwhoL0UZKo8gVJOcc8icD14CNxMT5tWT9yUeJ8kWQri88vkuYEwuXbwLLGAKOB
         qgqpUIkcq9/97tTev5z8x6pAmgc3CoU00rxMiXMqhrp/5/1XloEES/4hRyixa+Vnw4tQ
         D2nQ==
X-Gm-Message-State: AFuF++mGadi31w3Eej/fj1LaelEZWS34j4TlvHVKF4ft7yD3ZuuzZOrC
	MM9MmARd1Qqb/ENKlC3o+C7azFzPjfjh5qhshOH6ZqRnC5WWyfAuQhPCRULWZMeNKUgiGXAYEAl
	KMqSFjePfZuLSaaOsM0s0yf5l/Q7ts3/1Wm+krjx+FSvbTtOIp+r5ogTudxXgMxn6eWDD
X-Gm-Gg: AYBFou1B+bacYmVtcQgL4jjrAgjcShljxw+GeLKXpKmTS7HLWgwTS2qCwmX/jbSXJLw
	nCwhhZZhkFWDxYYu7ARUMj9wP/pWaVqvv+UcU7Z8EBQRmOGYlvrzEM/w34+xC1bUUv3Q9M1jr/k
	oXdEglpx1RS+N896k2+2ws3SbeQVksyYMiQ4YSHpbNm1PIVPD+oBn3b9fmpwJ1YYceV/S2KCmAJ
	1rHQQlCsVC7sufjxJjzib+JEiOOmVf3iRrOgXt+zFAAUl1LdJgtLdHj/bIl3B/Qy48Fd3QUR/el
	/a4sFgwsDKiBoPZD602LQFpxgL+PuXuiBQlRi7hA3XIVOuUHLoZO4GQSr5LmpXbYDn04dVe9NrS
	diN9LVOAagIUDgRQbf5a/53YRsYwmtg==
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613299637.25.1789312818689;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613246637.25.1789312818313;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm22243050eec.3.2026.09.13.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:20:17 -0700 (PDT)
Message-ID: <93c23619-f5e0-4998-8da4-9742d9e9be9d@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:50:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s5XYjopp7HvvXheqyU3jnEvm0a4qZtMM
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6bf33 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ygYGJKfEQ+goyyaro2Znww==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UBd3s1dwWAu4bQkakUwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX5X1AJf7GlHo+
 hvay3sKinWe/gvW7InRSaHoBLGQxsNxR/ws5/0jsVeKO3r6EeIOe7Bjzm3hvg0SQjisnSpDAzsY
 VXPkVn3zUtis6mwvdh/Mhe6qNU56yGU=
X-Proofpoint-ORIG-GUID: s5XYjopp7HvvXheqyU3jnEvm0a4qZtMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX6ynjVCAC4xOu
 dMFi2zNl9ZVfiKJx807ZH1jhqExKH3fB8nTUFs1SBhiyxL1PwpjLaYgQA9Adtgkz7RlPfYSBi4B
 zWaas0VPjWjztorNCzSsD/Drf7O74E7VhSwfakWHXvKZqc83LSUpERZ3UrcCHv4rjwSoI7QGvFC
 QR3IlOM7jnJ24fFtmZtp8edPZECfx006U9MWPKmTMjjcx794UtaocdV14x07KPXpI7qBMf4Vi9M
 p9UQW4FV613e1QgKjqVSXksazCoeVkEzR9/HG0GYfqdm8UX24qi1ydu+GvCgmkCaxjpwnpwKdpH
 jL9UBhctO6zi86KMMc7o7Qq/gqW+kJ44dAO+3b4HXkQ3jWfgL04GphaGIAFiD1MzNltYgiTavnH
 n1lu+K3XTjXf7FP0yow0yWx+UEhkWoC5PtNcmSYnG6QL+aGrPbGd01h/3wgN1H2FrRy3PGfqPot
 4A2FDRKYGprJrUQ6I2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130219

On 9/11/2026 3:09 PM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
