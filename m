Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328773;
	b=LH3D/7V7+QCDPHHGLbqWG9OZfgt+2QYoESYVLAXFN8vrr6HgcPKhQKvXoF7VxGiWv5Fx
	 0fWP6uFLGUn1pe5/8Ij4vIHuiRQ6QXDRWEG1Ps8RLLYVA0k0AB/9jrh2FuRfc040LHKlV
	 IgRL9f/Td/hVKm5ozmW80rzx2vVi82lAxpVyUNygj+6EkIoKn6sYWdDqb4qoM8V2tUM6s
	 6QZ3/+2iF7hVpr7yZDuCD4We9XC8qTxS3HWmaNMXs411pQQdw39seEz0UYErXzfZx2+I5
	 PAp3gHMIHvQwsLImts2ispq+plJPMVgOe6+xPir0uKWVDimoYnsVez4FgG3ZHJOHd9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=0jI54rKjBcm5L4qUO2UWCC3ildv0uBfIfFLVolyfeHHmPKQtgsDVCpRs/fk2d/xhoaYn
	 s92juQnvLznfPY8Jert5MIyrWjKG3r9PseaEI/+B/zpkUQQhOxpDfB69gW17BgUqPaV0i
	 4gLbu9BL03gGF6geNBTowl/9haK7DkwAHnTCIfG297q9uPioqU/qz4zfYlMTMpz+gyK95
	 ct3MtqSktmdm3D5rr2S4nVavcjwU31guPMmACn5xeQkJo2zJNgRro5YtFGmZceyBT8Gki
	 uu/3+HRsEJhVa/jdF1UTgqzFDejD3Zq5fFD7YWZqoZcP00M0Hm1X+qXzpzmnLfq0Amw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C460A2626
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278C460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fQj36kj5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7K+6cR+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF04uj141455
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=fQj36kj5uBANLLz2D8jINo9Px7d
	yfEOpLpDeUnwbeNVsidfvZzn1oRsjnS0/X9Q6hvWo8OrgJtej1IAPSqycWRFgR13
	jekJ+2k55F+kDw4l/hGsTZKdnq0fUmnWlUrYwu2dyLqqDjV9X6uJfsHUF3QoLMeD
	fD69THgU+ODrrvmBSn/wGQBFNBpSVJjESQIq5GoyHuKUaybg84dNOSkBefDGKuJu
	3f9YU+LVKQYlteFsYuESaAi6ULvIwsYx3Z3cp0jgJWe3kvZkT4QhcQSimh8jOo3Q
	DZ5Y05lEbmN+3WcJ3BFfBMtoVGoo7ItNhdatrIWM3+NNGxJtbp8kuQCUNIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4ctc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc37ee6562so223255137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328771; x=1794933571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=U7K+6cR+Jx9hbIuWw7QAX5OWbPuBNN6oQFMCNJZDLh5ObDwNAutsekxUupyP9uYfHk
         P8JY+sIUJQOQn2Vk2POJTPnJg1znZWGlrwX1THXu/m615UUtfjYXRB/c/ziNxcUQxQ3i
         CQGx1W5ND4ErDXAEnjFnZo+lbNrbQf0Y5kVOcUmyVocUa2eWJ2+SXjp1SP4t3i5dCD/t
         FYhPtR/UTgCA9W/Itu6x5Y0MF5cQBW4ALBkiDjCgIm1c56cs+LTS28CCR/oFb7VEHzcu
         JU8WM40YwnAsRS9kejsqCSGTyPqKpOFYL8yTPqm1GZZEYeLeucfcuRVi2Oo7m49MvUpp
         gdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328771; x=1794933571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=X2jA3zD+xk0aPUpQDF7X6joEObzcOtvKWvbL6WxwG7BEER+01hOE/ZjHx3dTPTAvoT
         lABi5pK3/dD3EnOeebilmaJ65yqtjylpupS+txgd/jx9UBrkPORA0uMKI09Xn9R51Auc
         NWA+EaODLwjI4btYY0fRP8+SMiwJreTU3jjeDoGikPAc0+NgHXmGcxb4KRVVgsCHefoL
         QxiRzmP6qqbrLK01y+qdgUhGX0W/R3aaDYHJFu7B75yWf6ZUv8ihe0iFWPLYs3H/Rqto
         jNd4NPMYA2iN54DRbXbiTpl2Pk7j/oNOS9bIDpU2MMDcdSPDyLCFeUJt4HEKecwO4niX
         dfpg==
X-Forwarded-Encrypted: i=1; AL+hErH4mbmNDQfpd8BQ1b8lcY0J1Cgk0TkvdF0EVOcZb7ZvWQpzRqk4HTmIgRQIbmYwjnhMeNf15u7whm4CBZL3@vger.kernel.org
X-Gm-Message-State: APuU4Z/4m0NEZmq324KKt0YjcOxA+9wXDx1gkuZdko0ZpS797SOnOZ9N
	vf30vqG+/N/lFue3BKUIZyQB3IbycG+OIbIkQ6qRQtcVhWCqlyNd/YCHrPXsvRJYBscxcbuw3zr
	8GoJPReYq3mXu289w7lqV6HxVzW0XpBrG3+f+raUCge/dkFR1dywZL147UCJZozYOALFb
X-Gm-Gg: AYBFou08slii9u2WhtW51g+dRisww4Qd7eiGRMxCeVvrVr6q+D23Gtuj3BtwCEaDH2v
	ps9M9Q4gvC8ro4RCfTTWUx1zyEnMBt353axp+Z/CaNsmBSk2ihJxo0cQEmb8PjxLE105lbbLW1k
	I5mDIdmU7M3TmcUm1ym8+6FqqWEK4TAUQz204KJpjvl550sc3RfDqKJo2V40nBH3IlKzd9r95qx
	KIXKrLjq1aVpL2tpn59Iy38JrrYinH89364WE/TiC+ZkT9sNuAVEbS3nTAQghqd0J7cklPUTUtE
	DiSBTUbfQqXkYUlNi41Fvr//tWa/Tsn9MX0e8EQoJDakFjNJOrlz6+hp4+a6ytttNthAl7jQ0V6
	cyEhIGg2geDkl7+qOUCLh4DPFs8cKJHSr2iF+zZDDtKSqVKs+51u1Mp6ONsknzGbU//OYVN5cIg
	==
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919135137.20.1794328771303;
        Tue, 10 Nov 2026 08:39:31 -0800 (PST)
X-Received: by 2002:a05:6102:549f:b0:7ca:e2c1:9a09 with SMTP id ada2fe7eead31-7d301be6b4dmr919118137.20.1794328770825;
        Tue, 10 Nov 2026 08:39:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:09 +0200
Message-Id: <20261110163909.78085-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX+XE5zYvJ98Tc
 J3vXJew1TZVeAuDmjURUh+3JQpe7ndIWTmNqm09IZ6KT5BIn/XR4XWPdV3VcSiZ1+M15x5osvql
 op64LLBN9l1jhjFQdLheWKE15uCdBm29UW+5wpS/ASIefQjVsZzQvZRn8c5L7qi/XoHAWrn94AH
 PpmQsJnN0uP5/FXp2hbciHOH1+6TBg2oK83YY0iWcW64Qz11NZnMKOO0wXIblOSTrRJwObrRPNo
 20Qhi1Ww/71VAnz7fR5oASVsnpDvxLoAxr3roJ2CYi0tbWPkPzM3ZcwXku+ExSnnblgSIBrxD8+
 qcEvxydSnu/VoOUQVMAjR5mFC8w1VDcwimgFVzdwsASZ4rkZj8LERQejpkRQEm0CRhK1j56gs+7
 Mf3D4oPMjB0AtJAjtgXgc0opOS2MqfAMoLjqDEJIG6CHDzsgkZ4zMEjDICBI6ofoIX5UxO7AT+p
 +istslU4ll0dkjZT9vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXxZV5aVhqt/XU
 g4Vq4tmBPIDOCXUJ41B45v4YjlxgNUuyovE+vI99AaOo2JQVfj7+K06I/yVaI2uqo04XiBz3Usj
 jBDn96YOIgwnYJWGFeRJBRmVim/mnXI=
X-Proofpoint-GUID: KXgILQCYHeZFHqTzOR0m59xGk2KfNFlN
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af348c4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: KXgILQCYHeZFHqTzOR0m59xGk2KfNFlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1

