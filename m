Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530581;
	b=Kh1mCIpipJJO4R557pC4w6mPDzQBADC3jfUxrr2v4waNpo3t1aecMhKqu8BaSqKbLDJg
	 e24an8OCgKqNt0Nij6FE0s7OrO1iLdrdR6XOmy3tXjK0ZzG5MOKSJ9Y90/113eIjslh7l
	 XJNMd/BcBtLcscGwGS/DqomLY75PkFhl9F3pdS3PLgRHNuLp+oBzJf4Yv2tel8nZqj2ej
	 cX+I0/T+2qbKYO/hlgUNyQ9GCsNJHkCbtImwPqKndIairWGZVoFA4LO5JrcKXHErOW5N/
	 9GzoRsM+TGQCD8mGybuxycCxwwhSl4AqVNW1nI1C6gO01pobswQzyOZDW0eHorlXntw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
	b=Y5Mod8ktq0ob5YzGYYQ8LHlrZNVzXC/AyvmG4zOXXsuMnwAWIvVuVXeAZZetc3cJytBM
	 Y9eZFdZXBRo5VuzYf7aSSIPPJpeEVhXghKdHIw5EWCgxNWVRvN+2J6/6jA5XLCIM9regF
	 Ku9cpPFeu1e40FVD1Bfdq4UPKcyiPi3e5MBlPkMp/BZ9YJc3EOZrgXXlLk7zi7dBxPWR0
	 p/fWXhTCVls+T8Hq28z3bqz1UVIRm40AhScGPAflemQ28ewdUHhS3Up8iXdvF5tXy6B+l
	 IuKi8SCZewd7nzJwafFTnJ1L+VXz8h2Wk1ljg2ECpKoxw9W7CFcKAS098EGRiVpqqlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46E606A681
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F46E606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3nSwHwp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO6sCouW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuKkp636665
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=; b=C3nSwHwpXxUDTOlB
	Z85mhzPKE0SsE5aB3/HidBUKWmlKlr25LDxh9UKeXG2xMPj9jaPk1YM3kAjVC8/d
	9FJFnxjtN+O2rJ2FcLcBh/mChv8XKaCkoTfRpzotXZv20RFo1kYnBGKrVIdDuQOC
	vRLxW54aZyqRDNwvqETo3SYEhoVmPHlVDQaDe5fFyYbwfdnf5ipw1PNkewahRVsM
	haIL8uRD3dh3wB2hFx5SpPrR6uzxwgq+kAbdmzTwcdPSFz2vgY7OEiqMoxISninF
	A1/FAk00cGp4qqNSh543qm7RgWXkhEu1Hj1V+8XBP00gRvXHGc5ACW9eI+2whnKH
	3tfHPQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpj8ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:29:39 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso68066357b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530579; x=1796135379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=NO6sCouWLZaP4DluoUnnxRT2XDWx9etvBkAEbbGDXRGEAx/FIV2+Ikn3rfMPkaDgwp
         p9P8jqNajGBHPeI9QGNes6OJm3i5BeWyklJ5/39VVrSv2KvKcvyYpsMAFQw6S2q17Us9
         41kDAuBIjrZLj301I5BuQDQIvqfiUvvn5L2PN8dnFUzgDQ8DTtkcpLrLIqrEvEvG4ZEU
         NF+zgmNKH+bY7uSgLoskYifXaODrfZ/lwudn1EA4+8xtdKuEeBE7AkHk6rNcBWl95eRd
         Ogrb3jnue+8veWKx13Xm9VCtF69w/PHRHEpTThY5YqAACSpOCoZkrSCFmnAiSGgtYkwX
         l8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530579; x=1796135379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFxDN6KjQIlR4M7e1vnAs+RlqOVkqzTjThBPVkt3CKk=;
        b=S3+cvB91lCXBNWeyumBjEDapoMD96K72fO7btIh5daPSRvpHLWpgq6l5GlTmtmSq/i
         Lp8nM7qUrTDpeS0WUO5ciholAM7pEHoQ5TpPpwNiATdLH85NcFefOvu7ZiY9mUZRBMeZ
         EQ51Izd1dqPVUGVhw1N1CZlX880z75THNEPBO62WdoAGrjTQ7Oz3mzh8Lm9nmFtmA6FD
         KxhPS9BOog8E2f5I540B1Jr+42vmRL8iN3jUGjLCKqBAGWRqiBfwHX0qTNn5lO8rZ7H8
         BHslZmcRF3+ZLgf4a+9pleObEPQ76e7j6fyNf7TH89fKtI2ppntVKvGSbwhgToBXmzR7
         fdZw==
X-Gm-Message-State: APuU4Z8WHxWVah+V4aemn8EpM1xlRHfxrQeJbpKxrusi1CzwBYKE8efv
	EhoIKtYPtDHb7v3c0KAPYyTYRgAc1kvuORAnBG4pBxpyxmhKb0zkmqBzPe0FxsxJbyDUcX7SphF
	57yB3LhmgYpvM9NjBg4qDHkNTuLAReBmzAwsDQ2vJ8JUIHOY+bQtEoXOi6tk9fHbp5nB1f/UAp+
	eb
X-Gm-Gg: AZFdTZcboZnCk47SbhjJ0TKDMEjZyjuJ5BjgP+HxA5c9+QgtBUNZmePQCpSzfONmxrf
	PaM5zRPpSz8Jnjtqydpxv/W3uormknQE+TtlOsZGmJ62YbhLN6H0t+lsoXkstnmNKC4ZZQzGA6t
	wbjss8y+sAVr7PMJx/tWm+/LcPO86mzCfUY8onmIBebY6orClpgSVrW3yBgfam08qrLzWq+LYIJ
	oIeEUrrvumFA3kONvl5BfDURpf81pI6B0yYB0JwcPuTdlPrc3STiVND5PGr802NVNWHVTX6G/lk
	moodsiWeOxVQdGuDo1GpbWD7GQQ/VyfvwWsXSy4QtfLNFgVdMxVMPETevC3OJrM/E/3U9m/5ea0
	vm1mCwfHGnApYy8xBSYbp14aZ6nGpRh/mx7bTZOsape66TDp3uMMV/MYLr2pj1EQPoyaoPhcn7p
	ZTzutfl8tUpslYglJjaW+9G5sUyZeRs1c2jl3CEwvZ5ET4niDqpdVawvrG8OL5TeA=
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14058067b3.1.1795530578772;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
X-Received: by 2002:a05:690c:a003:b0:8b5:5dd9:40ca with SMTP id 00721157ae682-8b55dd9415emr14057867b3.1.1795530578309;
        Tue, 24 Nov 2026 06:29:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:23 +0100
Subject: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d4nSpgsFUhJq5DuzeBsfwiXaQce1w0wxuso7kWB2flw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9C4f58IPpoMK+d+Ar5hpwv0SmQQ833MMtk9
 N11m6G44+KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 w+CxD/9xq2Al0MTuM20HayP4V0JFM0INq/iryR53a4qal+8W1gxajf1vJSt1JcI+AQT/WfFZGA5
 StVbRo49yak2t3CASMR7YFvUGz3nA7dvvSzjYJa6kwCsrirVF9VTHo5FN4NypxBUQrKQ3bEUhoy
 ZApb4FkjRnJK1r4mKo2ub3bGXUS2/N3XSuMrD1OVA2QzJyy7iygowDNxxFKt8T9ztnCO1mwPMGC
 r5MlFeeW8Z0gPv/l9EZV1apFYBSwrJ2s1an+hYOdMMtIZ1uBE3cdLEmbO1P3NBL6gEJmG/wVyuG
 55632sVzG8PZOqawl1HWUezzrCd81cYUx7+WuFPvG9StWqbMKxCq56JmQb97O/WXK4AOQ9zj9tY
 uTPjiIFMAm1w7sM61Rl9SbZBA6ShFzdI0NW4cQR+b83QapHrKGEw2BvBV4kkvvfaUPw5qDmOXnX
 kBn9wU7NwVfE6xCTZLpsoWBKV9/MeimmREPOoIBEZBV/3eCgroDD+4YLaxK22XpjcH6ACXgOYSQ
 aQ3R3yFr7X7g+VRGZtH7bRhGG/Mvt/SOpcfcPypu1duemGdfJCvXUi1PJABhl2ZwuimGw/Ktwoq
 h+Y/WYuow+MBtVnplSM7F79G4X2i5RVXfYIGrwXpm/JwxKChfgXI6zSlcCRdhQNfbPYDlczcN7L
 97mcTaICaZQJSYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX/A/Ti8Zh3Omk
 HhA8fYr0qQ375tKjv4bC5hwXKWYsqJw4ngMXRmR7hRszlD/g0n2yv9ZULpD/2ZqbfQaawrY41cm
 igw9SAalZFiNRzqUKB+7mfZENBskKodRy7aIN8mx++rL3n27rpJqwGNPGDIRW4dy8PHvIhrCNdJ
 hbThpmeKCN/JILtdnthTXDnr0y9w/1bzR4t7OVbHDhjSp/oP2C65gogX+rae5ye6ly4tHo4kAs7
 AvQVLZHMl3zCGD4+cSywHSSc47vpxVCamGjw2MNK5XNRCtVuWIOt2XNHcsCSLqTOiII0wQlhP4o
 NU0RZ2afXmd3sXo9Z6s3oZtEBAHuU9JQjz4uSm/PfdTLt9Bn3I9RyvoVExQeBfvQSAjCBjTgMy4
 9AfI2i1891yTS3aIiBvj4rJ0HXHwrRB4WrAYlcSpLPnyR1PUwtrXUgyMW6kmsSsNQDA8uiSs+k3
 sSvmjhgZtM+uczCmtMw==
X-Proofpoint-GUID: hjpOJ92MdrJWIDS2nSR2wnYhLmybHNN9
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b059f53 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eqPcoR3FCcofXUvmvEIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXzOFoiZ9U/u0Z
 iB5EbcFhyVSfqg6Lj3MSZAI4TQbYgLEFG18vm/h981TGDoCnCRPIq01JYNVFGGYjktaCboOpvEm
 FE1XMWXIaBGfKDM3uKN8TB5p4ms4upU=
X-Proofpoint-ORIG-GUID: hjpOJ92MdrJWIDS2nSR2wnYhLmybHNN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the kaanapali driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..85ff2f165c004e2ba0337170f8289661d6080103 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1374,7 +1374,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

