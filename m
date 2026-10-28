Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211047;
	b=0LYr2KtpXSXnNewqTj9qRtZozkpp+/2utv5zEkN6dSFUgWmEIl204CyBQU5DKSpmNftd
	 DJUKB4qPAzR4Vtsx18PLIa1M0MQg7iGSalkZhvieZm5SVxUI6OOLvziZ2NRlz7Bd44ioo
	 H/BKSFolzGWaDC/ARwUiWY/lK/qNR858lsrwYqPbPcoQrkI+1ONKoM3qboU/xulklUDJU
	 rzyZd5PyQNXY9E5rDs6/bEhxGP334XQz8VkraSLfJx3iM9JcazRMZMLGLTuaNQ9RLrWVP
	 S9ivFClAYOFatitdyUK7wQkAVeh1U7wFxuFICLa/CzbV02SiOsu3Cz8AAYKAs/3tMEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
	b=wvpZUBF+Hi4e0oGmLT8HC94An7IKgX99slUVT1MyNbdP3BhxH+zH7O6Df0/oeyFL444E
	 HLaMabcd3eyAW9tWW3vza9+CrqpsThC67OH962vnK0SrOAh9S1KQ14rb9QH4a3uu4pwqC
	 p0P/wmvfcBU+6o/jhvHzrM+6bYz+Wl6z8Ylz+faURAGuux7z0BrcT8rYNAnlYlY5hQfCS
	 WIJpkAgZ6miW01hXl1fECpBXql40Fs1zxSkQiF9Ce0udGfenAQq/6dxoXPI7VKxU0OrKz
	 C9FXVjMXZcESDa6v4EBQ546j1o7GKBEfg1J4kqVr1fijSpyWJCmyh2WMTUQSraVaG7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArxIu4Pw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyILZ4yb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F160A6F56
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4F160A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ArxIu4Pw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyILZ4yb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAIW42001994
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6u3zqcJQ01s
	SMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=; b=ArxIu4PwtAhxXYrlBnwxbsMSKn9
	Sa9Yu3eWK/NuQ/ZMmyh2bEcFsDg5zgE14xK3YIx/VdViTFPR3PupnD7+J0OoH33e
	piHVmnpn/wgAh27ZLAZOHD2qz3bymru9azMuhO7PU4r9+DZUoxeiMsSlk694qaUC
	QSDaY7qi4Gi7w5Xr24b0cZNDdJOSINYnZTEaLUgSv0aSS229Q7K2rCwC4TzP+btd
	46fuPGkeqY2H+Sw+r/pD55YlUR7rReFFEdb0XldyUsZkAJUGxWzpY0jDP3yphaP7
	TkI3fsZxELPFB05xHviqgvdAVD2dK6kwOYnb/Bd0TJtI8ay8Jv1RJVshkkg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7tdxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 18:10:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c70349f65so29053486d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793211045; x=1793815845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
        b=NyILZ4ybfIWMNXTIxPdmD98k45qlob8L3xmgmoH/y8/bsrzCr4DKiuBKHr0yjtlRYy
         N5UzUTuJeyDhEaP64mTsOyDy3pozCrcFvU15WqH48tOK+3rc8zatPzOqHULHCqVP25JO
         h6PKnNMEnBHUsAlJutFu1k+7chgkPb53HOwNsQl18v6Gdp5DDD73Aswgg5nE4+dCZs65
         0gXopaUm27EGIiwNNFerGiJPn9ZT+C0HXBETmPxewupaNCUut8q4ohOeG7awLpyi8TjZ
         4UQf/v3j0bSeX+tTIMilHex2Zyud4cZLYUAi8TYq/13G4rT8d2lRPGE5WlxaPAYzysXA
         5eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211045; x=1793815845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u3zqcJQ01sSMu+qm6L7bE2aybaQhlU8iBaL9JFnZjM=;
        b=p6mlmF9na1fdsaHkqyFGheTSJI16w/V1fC/6VzL1a9e8/6/rJCc+2wDN64naI/1wVt
         17VQu9fZe86EBNFEhpCwHzETj6YEnuT5M/iREa+VAq2NxCfLTLzX2fdHvewKs16doPem
         vB124K2+NPh9zfoPNVUMCgSh5KOD2D1aGTXq3gIrPkE3JLCkGhmGc8ws6afiBIRTTIWA
         L4NqTeDA/f5sdxu7JhtQVgOPgwF0hcKNXnWMaF1ft7Xw3lGAmbwGBo9UxrSWX4/I8pNm
         Im/dhDd6fjiV0xdNH7RfLwwO5CNesQV9Rd+HalXe3Ciu4EngfUUjvwugZ8+56w4L413Q
         cwXg==
X-Forwarded-Encrypted: i=1; AKwUvBxfCLMhe9E9HdKwB1QtaOQfhSa5JsTjOnRtHxfDQgr26hDfq6ozblSu1fUcQB+TYw7JjFeAJpWyqq5WenK3@vger.kernel.org
X-Gm-Message-State: AFq9FYLgmNFhE0Jay961869VKWrGocsCDoM8BtvkTrROlqg3e1aH++hj
	4v+//C7719MuAtLog7W+E4zOr9gMgfDyfUVaZkevObvjr4BbGpg0mWfEsvw4JUlBLjLnA4lg0Xp
	hpFapR8Vw7ozTusouaIAJGoIit5EMOM7LAInxAYiMnXWYX/6ufhqiKSv8Vr2r11TqKCef
X-Gm-Gg: AYBFou3azbfPOlxbX5wyjvvg7/nWHNPcNIjuLLephw4QgwaVPuTqODjwE49Rq/+RPuu
	ypOVDg/f/xUP09Mk/hp3XreYWYx+P5bnbeIl7MjlizkC+ITotn4e0aEOQl7+dH+6V0dkNV2gwy8
	SOFVexBDHVwkj8aQ5yQLf8T6q2UdQkdpZ8QHWttTZBV8/vCLK9rRd0FqKi62JNsCHNX0SWekY3P
	XDdEYoJBp2MvVVzSv7WoVt5iD+yrFYIu4wD9QL2hekm00Tm4M80HGmfhhhG7BT4eHC4UUOgheNq
	mbQaRwCdkfpVT3n1ibej8mN1Ryk0Swn0Az08wXMm4Wm2W7gNw52gl/3LkLnCF/4PNL6ix0SN/Oi
	AjGG7gRbC8Hi76Me+wdWVaOa2wcY7INCa3xe/bKfFAwu1LE1sJmprEk5Yy4rwXFO208dkFR6Ilw
	==
X-Received: by 2002:a05:620a:6493:b0:93f:2ff0:87ef with SMTP id af79cd13be357-94408a728bamr431343285a.15.1793211045236;
        Wed, 28 Oct 2026 11:10:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93f:2ff0:87ef with SMTP id af79cd13be357-94408a728bamr431333885a.15.1793211044276;
        Wed, 28 Oct 2026 11:10:44 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm9801595e9.15.2026.10.28.11.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:10:42 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add interconnect provider
Date: Wed, 28 Oct 2026 20:10:40 +0200
Message-Id: <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com> <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com> <20261020-bloodhound-of-remarkable-debate-11afe3@quoll> <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae23aa5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SLSU3p2cmSaEdqdVgzYA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 0GiClFYqE3sifzYHkqMQ7zEnjyShDfiN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX/3E5YI73i8zY
 w98lJ4CaaSiuB8aXziONUd4UPTIYbAmdx/bbyaGhuLy5qsw7+Mqopwd05ar+BYeYoJd+08+ZOtb
 +85nzz5X2lHefS8b4HKiEv0q9Fm5/cc=
X-Proofpoint-ORIG-GUID: 0GiClFYqE3sifzYHkqMQ7zEnjyShDfiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfXx5Rd/x8hQWN0
 XwSYYBJ/dS88AolbfNhUWhbHH35gdkqo9mdxNzZ/x/e34TdonwmFTMa49Tiq6sL/9hFV7ZFaC1J
 p2RjkTh0vtBGVNqlJR6bl1DE0a8f1M2dU3/LV4bpYGME3KuALT5KcLn7JFgvEFxuUpiKFjjyglJ
 Igx6AwmKpFl1Qsn9j335fBn6JOCwVPk2W8vSdBq0nwx7WY0v6FCkPA7ZAlV18AoIlBtiLG3E54D
 R5yWurpy2l0GtOOUzXp2KEfm+YNII5DvPCZs/19iBiVQYbMkERgoVp9YhLrrDLD+svDjYFsqUpJ
 G1FhXkHJvUXFQ3cgokK4xd4LPDhxj7PQvfmAU4zolEPQgJBoAMGwKoMhHXXtmGQmn8TLgMfozt4
 QluUJ0USX5qZrR89Oak2jSwKQKq/Y+j2KeK5Emq+z74WhLdtrTPoTghFVf8Z7aGsmNJYyPHyVBI
 wyAocsJahPd8/jFKNEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280072

On 10/20/2026 3:44 PM, Atanas Filipov wrote:
> On Tue, Oct 20, 2026 at 09:12:03AM +0200, Krzysztof Kozlowski wrote:
>> If you only need to solve "last writer" problem, why not fixing the
>> clock framework to accept the votes? Otherwise this should have
>> description why it is an interconnect.

A follow-up on the second part, since the problem turned out to be
more than the last writer.

The last-writer problem between the CAMSS VFEs is now handled in CAMSS
itself, in the direction you and Bryan suggested: each VFE sets a
clk_set_rate_range() floor, and on power off drops it and sets the
lowest rate explicitly, so the clock no longer stays high:

https://lore.kernel.org/all/20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com/

What clock votes cannot express is why I think the camera NoC is an
interconnect:

 - The camera NoC is a bus with several independent masters: the VFE
   write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
   and the camnoc AXI clock sets its throughput.
 - The consumers know their bandwidth, not the NoC rate that serves it.
   Converting one to the other depends on the NoC width, which is a
   property of the bus, not of each consumer.
 - Masters running at the same time load the NoC by the sum of their
   traffic. Clock rate requests can only be aggregated by maximum; a
   sum of rates has no meaning, a sum of bandwidth does.
 - The rest of the camera DMA path, from the MMSS NoC to DDR, is
   already described with interconnects, and CAMSS votes bandwidth on
   it. The camera NoC is its first hop.

The interconnect core already sums the average bandwidth of all
requests. icc-clk currently derives the rate from the aggregated peak
only, so it does not use that sum yet; that is a limitation of the
icc-clk translation, not of describing the camera NoC as an
interconnect. It can be addressed in icc-clk by taking the average
into account together with the bus width.

Is this a valid reason to describe the camera NoC as an interconnect?

--
Best regards,
Atanas
