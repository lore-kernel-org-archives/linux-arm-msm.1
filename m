Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806880;
	b=HbFfKxgmFgTrWWjgJHvfFujSnaK4w14XFLmap4wu4UmzQoHaDIELyI9B0H5jJmgwpZoN
	 2VbU9iv3rY5YAiD+K2YOUSjcP/fuqstaGs150QaQrl98zsMqfydYCj8qN/X3yGOC2bCEu
	 ndKhOCtzUK6/lnNbubHWr7IbTF3mHwzuKL7QhFHXn+9ASOMMESmKw7lLpohQHVndilFYO
	 PDxV1j+2DFyXmU1+1lumTZS44D8hk3tXef97xJmrKWCS3bVhkyG4qPDE8+ahMQQ+dQlVv
	 94CaXGKJQ4k8Mh8mKkJN+AwkfLMLJwS5/6EgjB0hO4Qvl6gmfjgXhBeVd8OijqoCvYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
	b=dOgWqcxVrqmnKPtt9Yt9sYaJC64pbcTM1fuVVDjoxbCEVxg22UbOQvcpJDRcQ+eFHK3T
	 t94mQzsS1vyVt2GZ3QBGhfyztDc300JtDJQXU3Db3YVRk0pnYGL/5lx/7jUWTPgxx4VxW
	 t6PHsfpook0gkqkvgznToGDSM1tOc3Z5W+7Pdka1mLI59IdhIlDC16nhKNHzwz8NonHn/
	 5Z1nvIKva7+XlPteM/Pb5vzm1G0E8okWoe9lhZgwI1v9RS/Oi9IcGEAci01FleTPojaQz
	 2c+Vlb9+lEfNyjQ9JELn3tbayldvBkKIy8LlC91UiDVsmu+BkMwBd6tq9ctIhds8MhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF96606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3r23177646
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+weSNdgV6tyUTxoHk6wCxY
	0+uFMGSPWr+uTDp0Ozmq0=; b=Hnu0e8CaUWlDnfFFRPHUq5eArNphCs1EIWdpQu
	9Xq3HonxFTlBt8kgDrV1w3cPlOpIHUC9/ehVqHV4r/yKKcuP5MVPesE2XAlZtOwV
	WZlOgTvtisKbrAqvYhEkBXt1yCKFs1vb/gjPy8hxOazAv7YUud4Q4v4NHgg5VM5u
	aiYQ2K/ZcLPjh8OcmW+U/CciXkJ7w7R+1JBhP1e9G7dtnfoA3K8oxNEkT0BWYcIW
	SYc/NOirU651yYiGlGchxcF45D9q3zPTpALOqtcUANfDZfNinZlYbYfNgkpgNiBK
	yAmI6m06HV5unUFj7MPiY/c/0nOT4sz7gD1KpgI2UUun4KeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmccubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb86c39250so1513157a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806878; x=1795411678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=gRQh3tXWDi19GaaY3LckQIvctxQqriqHApjB5+26o7s/OEBIYUkCAoRF5HRDCGR0te
         iYMFa1xg/Bq1VS6M3Sx8xPOrE8EmoKc1Dj+vDxdKJK62LIsMuEp7tUs0OhpIpAIVqA6K
         ly6JxBZ0VYCoOqCvYMCmc/6CHlm6LTeczDwjPz26yoIpyOEASXnRncJGvhOeX3Larwx3
         BJB/CNsszg0EehCB9huTGkhJ5MY6AjGyHpqIwhQsV6BL80RwlbD4GdPPd8+6nNkTpk3D
         gd877+prVfX2oAUPqd6Agf/hlxkL9xh4+y0aoGAkqmTzHp9mt1G9Y/WYYiG+6LByQXyx
         CYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806878; x=1795411678;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=jC9tXiGXrmQu0yPDJ0bWkugEJOPhpfMspsIj+h3W8UriotLYZ+rmFkG3s9k9cVhfD0
         ilS6EVOxCMlZMaVAXSXOBAeSg+FNODzyBrdJAhXYk02RfeCRtPaWuhQCFpdoBY4CUFnc
         T+tK5TXMwyvijoZDkW7LwS/CCm/NblrRwTyoi7nMDznYJ6eO+1RtMzQzSHuVYBG7iPAg
         /jyzeMZsaMs7LE5ZWVoqPHaZShn+7aPd5ErPPJ7h3kw5l5naK4NMVHLkvyHsj7qcneix
         YCRn+3GWqNMClf/00lgRuoHvI5r8RrEV7pKMsG449qgjyQdLjBg6A4qjl4P1Src0lQUB
         G+VQ==
X-Forwarded-Encrypted: i=1; AL+hErFEPm13TCL3BU8JkLITgcheGdg7jwTQ1sOEXRMcPLbl29wlRE/lyZ2meVvLcG8C4Eq71T/DDXoeHJrecLBX@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZthqEuctsBH/2/R7Vhkn+xlVh5rzqhlxydCz7EaAm4dK5TihD
	rn9wbEAibx4Zz5MWWnYP1Covsbh3MoHR/F1QlYTCv5FifiPFZeqdKL5YHWJ64+Cjz1WVi0DqC85
	7JU3qzOjUq7lJjE+DKisdN2YmeVNTXkoGb8BoxS1McgtqwReS8L4u5D5q4Dr8yf2uqo9P
X-Gm-Gg: AYBFou3P1zARw6mdhD1IJ1RGvpDfETDlPwd2tZv9Kwd4vOiROTYbHhkPKAuR3gKdBaN
	+tlr+MJjTjQ/R980TU0v7qTnasMHr7zQyzJduMOgGMsUIDJL66acAJbyAdwnUY2ueVQenAT5Aa/
	waj5v1Kby43xENhVvfXe8qDqg/3Gm5/sq1DdTUQEqC0LU/o0MOduGyvh9MzIpepwAuMJotTSPQ8
	8MiF6HlRBravdkVo5qbW9tSeGncLWIvSJPstiWW6GIQz0Y6z09q6GypA3flEfuze1oC+yRvw1BP
	OVnIf/U2cMjL8QSNyTs1VimQ5azSKLVIQhDw92mUOlHEDO+RqrvzRbFdEUns9vnVEpfr3y8YiFw
	9PDqX5tKAyc0xFLUIzHKIjx29pEEvfNCZAIXd2wDFjToFeUZgyfPTfjHymt8Eyue+WMrwDW7tEg
	==
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023265ad.68.1794806878429;
        Sun, 15 Nov 2026 21:27:58 -0800 (PST)
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023115ad.68.1794806877971;
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Date: Mon, 16 Nov 2026 10:57:43 +0530
Message-Id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+U+moC/x3M3QpAQBCG4VvRHNvyIcmtSFprMPltp1By7zaHz
 8H7PqTshZWq6CHPp6jsWwDiiNxkt5GN9MGUJmkBoDDHtbZu2d2srU4ye2uQJSU6IEfmKHSH50H
 u/1k37/sBvwa3N2MAAAA=
X-Change-ID: 20261116-pwm_clocks_shikra-13081b11413c
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX+wyPJexRYFKL
 PqNgusQy4FGKZlwYB0mMZsLMIgpGBtCHqXkIEk9eZN5MOQMcDpEFTLi+zSHoimHvd3w3dPQ7PtD
 JkEZmraB7DYxpSopGfX9GJqhWrKnVHM=
X-Proofpoint-ORIG-GUID: 6RmQGeR0ZEAk0vggwtyxKQNGQv3YHskn
X-Proofpoint-GUID: 6RmQGeR0ZEAk0vggwtyxKQNGQv3YHskn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX0Q7iNflkzO4T
 KSFQQqun5YBevQGVO1rSgo2n+Y//7NAujfvmfwuPfir1LvQ3OObiMWiKSbbKwUjsQAcNIfmV/rL
 J7kqVRIXTHXBfTe1Af0CEKTW7PA0joPYNRUt5GuxgADkbdKOVuSalINRHkig/576ROG9GeQDXgm
 uYWFB7t2mAChXoco5Fpvwz5EUKPjvpGThmF1nYdDs5zw3vkAZyPWGkH2tQ26vyYUsC+2vGPPGVP
 pX6RFoT8g3k0Js7gQBJe46025O3v+xu2R6JwEUQyMXaRAxodUtDlQpQSEdQg2+gUGK2t5hvyDZe
 lfCOfAp4xKm/Y+Py5UIpbCZWfzeaWtnDlqaaCcEihu2/JlnZbb8/clODDgGCK6dpvVw3K6BCG86
 5b5xVFcA5XxVngDORbECHT8vONKpvDixIu6Vx90noTZnJbEKKjqZTii5n3nsYozg3ryb87STjuU
 pXOHyXIKOjZ6zlaZb8w==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa945f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=P8prvrSLuabxu7ghDDQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

The PWM controller on Qualcomm Shikra SoCs is fed by the GCC PWM XO512
clock, which derives its rate from a programmable divider sitting
between the TCXO and the PWM core output. Model that divider as a
dedicated source clock so the full TCXO -> divider -> PWM output path
is described and the PWM core rate can be configured at runtime.

Add the clock-ID binding and the gcc-shikra divider clock implementing
the source, with the existing PWM output branch reparented onto it.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: add Shikra PWM XO512 source clock
      clk: qcom: gcc-shikra: add PWM XO512 source clock

 drivers/clk/qcom/gcc-shikra.c               | 21 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h |  1 +
 2 files changed, 22 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_clocks_shikra-13081b11413c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

