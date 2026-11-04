Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788699;
	b=gIatr7rSou4y+PJ0bRe1SVHvXqmr2U5hpI96FmkEKQ4PP3kciSpRe68zhPoF9EA0/T11
	 cnNKs051FAPUw6vi1fqzW99FTWqTtvVA79Lhlptl5XUp83wbolbGEOto45JAxkuRQqDPN
	 0/+dG01MZgIvEVgQnPOQHL8mfUNFETR/hsilpcYhUi4Z4NnFcqYGN2WBbYSQdnfib3+B3
	 qDXBd3GDUwEnfn0Ffvlli8WiDgw4jV5a5ySDmMk9gBD/5MTGlHRf2SQltHyC2CRkgj39v
	 Y8+F94HiuzxcQ/Mu8ICQaVZZ7ZmuwFfkdxzeM9D6eNnUgtFYupLLgE2+f/UwOegOtRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=GcXWlD5xChgSb3GNltSBx/QvJr0U2bykcgf2DjuqqX6lHgsf0XOdQB8PFJBe7mNMsrvy
	 NhBYs1o7xrGr4UCzO38+CzmOX9tFcYDv0lFqQM/v4iR4WgVviWvinceLuX1hZ1XEvMFlP
	 t7LPtBSIukvk3i8gvVc3KWrc9//veptEnzEdkrghllJuWIH5XosGhl7a5SWf0z7fBoUaW
	 Vdn87U/yWGHglr+hdaDs59JZa+Ak3d0xTCDtX92Vjvmo+kHPx3jcu5BnPwFBi/rZpVMxN
	 pRQSxzvwV3Ij9bvlhQmWkshokdTu4maXj26d4IPhOeAueWKPwMPVuTjnzZ/PNpPtS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYTExsHx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXWz0xJ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C64606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 10:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYTExsHx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXWz0xJ0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KisP1229292
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 10:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=DYTExsHxFhX+Okqe
	vIr9Wh4bUVxtW2EZBEFGnVivX0WdT/QyyMRZgyxzLhpvyrMPuBiuyeQdT9UUQrZF
	U3zuU9cPnTufPtUuro+5YextSAYHrKH2FsfLsPUTFwdQrwEvKJNjBepzyZbsLY4v
	rfGRYS2pVeFMYL3ZmdMhFueooUkoT9Jv5MAPsZPi2PAKPemt74n3I+r+EBN/A0gC
	XxnbVSqakIK4AiA4RIK6QA58WzEZwu+FZnc7zsWmbCJ4tP+GQlMM2TQPXIkE5qUw
	XEUIg1JaXYC64hsbYayhn6aQ5zUXum0BG7zjxeAuADcfM9z30F7I9lm5c65X0AAw
	oHdlUg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8nkchh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 10:38:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98304865f02so506878241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788697; x=1794393497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=RXWz0xJ0xJ4nBz15AZ7kv/3aTHaWJgF4hUk6PP5VlSaNhVQgdQvDFyMs4sfDH/3OJN
         OhEdtsDDEN4kIQzUGpmxGnkm1m96949W0rnIwdBVH2F8tE5bfY2rqxZQQBMAZYxfK9wL
         4RhgqEuKRoKrXJTk8ZEqQr9+aqZXVF+WcyZQTulPkc5Rc3Y38CO1wYboXTzHXMy8Mpmf
         WEP7Q7OLTu9G44QHDqyDlhLSviqm00YKSWStsXG8sRLhqLdqi6EuZBlkOTiJzr6wShFK
         K0t+S0GQ1a1Ddj3Qe6TmViKJ41ZkWoFQYfsqE6o5OHhaYGrfR/dLl9Xguqs7UXZ2duZK
         jFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788697; x=1794393497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=14e965vcPEFcL1Bf3Hk/7C1w7/YWjQ8L4biGfvxj6j8517Zt2XSnUDR7Ye+LHpCjvm
         2Ef9kIS6PL/yqVp2cdx8vz4SWQLw/ZbU4rX5d/SEvjcomqXMe/KkUqKbXj/DLX8ZvFxJ
         P/EmuykaGZwBX2K+c+ex3aBm02q1mfDcqZqIvayDsXNqJk7bzl4f/4KQvrncaHWOtpJr
         UuVa7VIw6POJYELRgbZCnfugi5uq40L9cNlykvDQutBxCa9Iq8hLw0r7MohGsABs+aID
         FYtkMM1zOonN4O0h1L9qRhJMBf6+J+7B+6D3aRvTY2SH1ywRLjww/kw5HWO+4KTQHNm9
         Q9ZA==
X-Gm-Message-State: APuU4Z9tjplhjj6TP3fXeQNrGt1hDd95dO8Jx5xTf8jT+ex30fCQtRZQ
	img1bcfTg9fMVMnMYvoiCBYoehphJjbqMmok+NJ6ai8KrTysXqRRoTJzozn9njSiV9rkJQUF7qS
	rIld/pR/IKS27keXWoUlmgGfpWp+9+UeWXFJo9sDF6pTBEnRLK28J88fJJ8f/zEb+JZsd6aDc9N
	cf
X-Gm-Gg: AYBFou0/q1thilynIIuMjnRIEZhaeFlfToTt62KXSKmvtHxwd5tpUfFcdGoNUCLKYYe
	qJZrEsO7SDA85KWu3mzclY+V1eI7C2o0MZTg1nCi9eYSAiXe6qC6T3HUfIpGzMMq+6gSga6uUjv
	oZnGekzUy9cnnKOKjhJoQAfzhf7GZg2seAFGwdPb9t3tZFoTr0l27+H2GGrn0bRW7vke6XDdlnw
	VCEQwjY8cI8ix8B3kKF6IAuVHTGcqb/Af2rg/WVQFMArzRh8AczxVWCJEv5oXQQI/buBlLHMjIw
	FLLCZH0XxSDD+DO+qnmgMKvFfY/wgUP5oP7MqhKLRXPUhQfB+kMijIY5ClD02kd4hkwAX0Y5lYQ
	C7CJI4RGt5QmcOOtWk4pk20S92TJOKjaTLLE1s56z0u3XdMLLNDBD1J5JNuB1q88QlRDASQeV95
	00Hw==
X-Received: by 2002:a05:6102:15a2:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d07262d5d7mr6368692137.9.1793788696675;
        Wed, 04 Nov 2026 02:38:16 -0800 (PST)
X-Received: by 2002:a05:6102:15a2:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d07262d5d7mr6368683137.9.1793788696164;
        Wed, 04 Nov 2026 02:38:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:09 +0100
Subject: [PATCH v11 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-2-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSDJ5GwhCILUM4ANJvU71DdShaCIhqBl9Cf
 TmR77+Mf2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 wy1YD/0bCNn8mJDmIlb4RpW3YAYwrv4RHpNhAXPbQJ0pqBve415Ehcsq8zRfV8gL3HyKDGbYKsn
 5lCeW4NGBQL/k2C+49sr6005Kf8+vhHCCGQcdxeKq6ukee10kRQxdIu45wLkkz7CDZg+f1jqP5j
 8eLkkOtGaGGS4ACBRyeV4dsawSZ5NIsKbXkTc9bU3d2JV77H4PrBDXBKG3x2MX+YHmX4f9s+jwN
 p7V6VgfRPIExzGSI2pRxZyoijN5I7kup/R2JA/xqDJg5mjZMpLHy5o+03uag//+I2zd4hJicq+f
 UopkoZX8TYITeAYfAuZQ5Nt2eb5H0vm1yfhwKZEyr9eYDk3sEgKB6fjl5qbB/AZqvVm+T6OhBVH
 QLMyictEjRl3VTYH0j/Nd//nnvYYmN+MH9Ut2XMsJ7ysYzZaDRD8ibArVmm50qbEavCAsOKRQre
 QbaLPCyTqbAsmK8njBoPP43hu6fL2vArc1G6J7fsf2zkxpKUfzojjjIatd/dCy3edY6s4GwlIQD
 0ykoDoO0aHxeaBSQqOJ9GUt2FfXl31I6ES0apdRN8HQnI6i3HcmCPofiA+6btE7o/ZWqP2rotDC
 C+tqERFXFHQgh9cuwd4iF92f2ymuS47SgUj5+ZzLGIGg/TdZl9FgOTwZO5gCNAaqIRxakHJ9P4a
 X5g8HMa2F7Cff5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX+GMnj2shuVzb
 CL6PeBM+bA+H/NLr+50s+sKAh1g2ybsMPJcz2BVMzo1hKks6EDIdB7UIeqXbs7I/AeTt6CA5b5c
 CqgXLRQVDrqqmgTBgzIrYA/EPG0WIMzQJILipqTxxOk7ZNbbpRUAu0QtrarI0Pl0npu9bEVRTgB
 GCZ4zAJ89DJaZ2pqkt0BXswLq5WQQGOU95ISoGgNWS+BCfMUn1KDs0yV5PFC5AuTEL0KN2gV/as
 /oYi4Jpl4dWxqYpGQi3BQek0HyyREbUqokAitpZffGSf1dsGphBBkacw/CgjntLxR9hnYzz2iAq
 1RgrGA5qdmPIWKrs5z9hjRAYdd6Tp92aXtl7lc275HjhlFMN+xjfR98ZH/RIIkmSXQrTb7ynmMx
 IY6i+AS000MInXYl7xg3Q3JBKPz1strtwz2+N/LLbmjBLLA0wtUtCpczRqgo06fefkvhhRrd4U3
 Gdx3uwEgURxnUwzuQRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX/OoAlw4Kzxtk
 c3p1eJeQjusq72nJpk5qtoTryGPJem86WA9aTApndualcF48hx8DxXKRjJ4DvNocaz0L4av3USF
 sJ00WHA99HwM6Cc6FJNTxVBIHuPNUbw=
X-Proofpoint-GUID: FaPuPfaW5tOA3iLa_SwdDTHL2nMGqZrE
X-Proofpoint-ORIG-GUID: FaPuPfaW5tOA3iLa_SwdDTHL2nMGqZrE
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeb0b19 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can translate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

