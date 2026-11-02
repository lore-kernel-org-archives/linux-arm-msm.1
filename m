Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615494;
	b=Di7CwcCtzEIY3A0qnwEGDkSEZ0Xamm67spw6XOIBwjX1S+3tgsEelCDUypJRQvKAIQgD
	 l/X0C8MfXyEawUdQxb+QnEMn8xtitjhMNiM0Cz+FuWecHbkk78h23qGzZwXR0BDZHmfTI
	 eYyw4veh+ya2HG2VU/Tw759xNRQdzZSneaI0N+1vyy8hyQNt0HuOiHzS460IxK1iMh65d
	 NBCZzS6dKJpgvGpZKxFedmqyq9FFAV/N7rXslk9E5AZX8RXGowFEY7GFOw+wwuTAhDEUj
	 diL4LD+YC6kQpFA34ULplL4Ph6UGtNh5+E1U4CtmqN9LABEkJdGSzTSp6jVPuqAaAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LC4a57rGSumMejdWCZ75d2s0Usyqle9Uga0vcCXouQs=;
	b=Ps4u7wzRhen1KdP3s5vcYl+bzcOwufqpM6SBpIhrlw8F8hFDUrXTQ+k0/mH+riDpEhYY
	 JanLBQG5ZAG/MJ5hh9d8eRCxZojHfLac0zAuG0oXzC4moxkUWz2iTpZzzzooPJaXOOyOC
	 9Q6K6phxpx8E4+TrdfI8y3mGuYiMv/1ACbDQTu633qhfNH2adx5RQOlevKZguYoWQAOSp
	 o5kw5ze5vOjmVMpX59DYZPhi79zxJLxs64lzHKIZz2ch8AwENz37cLiTehm57I0Egt6q+
	 jM9W/ntRZXyI5OrYMyG3CO4jAYFD7FqDTLuwdLqoKqLl57NIJhPMxTS5bfS3pleAjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJN3teFk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTUe1pMm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFA606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEFA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lJN3teFk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTUe1pMm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQDe3440401
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LC4a57rGSumMejdWCZ75d2s0Usyqle9Uga0vcCXouQs=; b=lJN3teFkYBW+FNUv
	yiN9cF3LekexHZmXBEqdM5JR+WPoQnVvuYg0SZYwLcvFVjuV3SUORE8HYlnuzpc3
	AsftJfcMYvieK6GGHuAonEfI0/T1ew4mhJy7Cb7yfRC/AnJqM3nVy1YXi4jaruUG
	pQ2eZt6cLBCstbaFBcAafXi8ngFat4IiHvLvHfwwg2Tuq+GyQ22hR7/N2++detQc
	8j0QNi8yDx03VOJHfQdE2tLXd9QwFEQGn5o+s+6M8pe0YCS0kvNjwe5W3Q4xWNp7
	U0TFXTPQpD+zFV7HkIL1LTTUpq+lBgldBQjtZAqjT/QSRyDT7HZivxXvp/8o1+eF
	mIEEOg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201w9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:31:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so462728585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615492; x=1794220292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LC4a57rGSumMejdWCZ75d2s0Usyqle9Uga0vcCXouQs=;
        b=OTUe1pMm45UcdS+ynZl7kPQ84QrnHPqLzzOP360kgMOcxMwEeTRXhwTSbt1UEq61dg
         zmSZ1137ERWxlalJYFQ++YgsU+bbw0OMOFUsAOJjtTRoGbni/yXH8aU8vMqUFIIyJJbG
         Sjm+AMFcnO/4xZu1eXq4iNQeq0P3/TY4EJrzyCD5H50YHOKX2jYLQMYbi3I0yt1JjzMu
         cfy4xYlmAP8Ul7u5RaHjd1x/YS/1QC6kS6qv83hWzdAsOZXZK+9jMLVZc8rUMAlKyrcF
         HKLwzFH5hzLqUxTBy171mwWLHAEvvEIoG6MrYD49VHYPCftGu3dWTOvVS6b762pWh5kz
         dNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615492; x=1794220292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LC4a57rGSumMejdWCZ75d2s0Usyqle9Uga0vcCXouQs=;
        b=WbPLvuLOtFknKoYu/tk/zbOWn5HJAE75Grjl2iyAEED4DVG1SEEWicKKoyGNQ4hczX
         ALw5D+1iuyJVfUH5kK6st8O4aN4NMXZVrqJdgMeVi6xvUaqTxKw7COvQ97I06/68WWNS
         COXK7PcAgRMbjFbXl5Qr5yTUfY9SXqsDjlOiUVqU6qxmCffFi7RpZCzDwnu/a/M2ZH8I
         RT99ljPA6fhFPxyQ5fBNjSS7IuHrv7lkTdMVXwbKcicg99LKxZks8CW5z/j8DG1UjIPS
         2OHa9vmlh0i6cK+rjZz68hKX+kUUcbVgMDq1wp/HChmMHCao7dG7eGwWZQiVEn2pNA3T
         db5w==
X-Gm-Message-State: AFq9FYLo1v6oGqqTVp1VtS/QAibd81bMjhnrGm/5zUI96EKFYXQXnEVK
	UQGktidnx8Hi5wOhfzNc9TWZsp5MBc/7ZmCO9tszG/E46XqID0rp1otXu0dhf2vyHLIN2/Q9pr+
	2eoJS9p6JGFVUPlbGG9SM2+sO6VrEcXpUiWd+yxne+YOEgtGpGrOBnnHvmcnY7dSLk9g3
X-Gm-Gg: AYBFou30FsAPBWa0cMDbclE0Ucdwk4sOEvzb/0WNVLh7oLVKkg3HeU6jHiA++nqGa9h
	tUKJPGY0mypCzakaypG4R37qKSviDX5WZ2rmHMmCCiDejemRXL3U1q63EhU7Bht/TgTzLaINdoW
	iREd+pXzSgXzngmbfPfVZJGamWoeSRCOZslpCbdsZVwbX5FHDfN11Jk3EzVWFaULTGCu+SuNryq
	u74L9TIDy66Rmi3HmJWpN6tlQ6IQ1/pyTL7fdosDUljKlcrR7+VWUpuI/xCj6LpbYSe5NJsfjQ+
	V8RPEUY7/zJhUEW9CnyzOf/O86tBaMzg9i2SzJmT1DD9TKBM8TCC45Cs1i8Cf/NgWws28hVjRN+
	mAKozT8hKHFjIlVPTTLcXGA8OZh0liED8SqgmwM9guN77S4aADSCBtl4REKzxnuSik8Bf5xRMtu
	W4oQ==
X-Received: by 2002:a05:620a:2688:b0:93f:21de:f3da with SMTP id af79cd13be357-944216f2010mr1452048385a.15.1793615492114;
        Mon, 02 Nov 2026 02:31:32 -0800 (PST)
X-Received: by 2002:a05:620a:2688:b0:93f:21de:f3da with SMTP id af79cd13be357-944216f2010mr1452046785a.15.1793615491730;
        Mon, 02 Nov 2026 02:31:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:31:21 +0100
Subject: [PATCH v17 2/2] phy: qcom: add the SGMII SerDes PHY driver for
 SCMI systems
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
Message-Id: <20261102-sa8255p-eth-phy-v17-2-aa138f2912a0@oss.qualcomm.com>
References: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
In-Reply-To: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5648;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m0NfEAr65Ya7sSDjlBSCHwDfnH7eejsULme+UVonYRI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ/w1HMpv6Sy2QJE3izdqIxtXyX0UCvuAUXl
 kba++uG9V2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmfwAKCRAFnS7L/zaE
 w+KHD/0YTe1K8/b0lrHfvDU6R0BXPMSzeZzJRTXQ38TN4ID2pCqTwi0La1lp7BIwKnyEU1wHhQ6
 DpyzibBxjA3At1P82gOGIwiXsx8yMOZA5d5ZuGtJ9zWcnZAAzyPnE7NjB1dqcZpYGSHOnSZfJ7v
 JTmsfJUMVxM5ZrwJZvXkdOyseAr4wSG0zGgy2NhjaETJifSJpk3YtGKoIhlqrEzLpJYwtn1t5Nu
 RWxhngH9qalCedIzIPed621VhJ4AgIplPkddiAqMjYGjnsacxoEDwa6NveGWn6kATaPWy7Dssfe
 r7PsoEZrltvp0rWxWqnFFfcURXXkgkTnRFrXA8uco3GdhL/7iM+oYTp7o5t5nAUU+VFcpCn35pd
 2ifwg/aiiXNXyOwL52LjOxvqM2eJatMihOeVHYW0nRuuBwMhN91yi/Z1F5UaOdmO2IzWqmtBxtg
 H+Mua03VyoCkLr5D4VX0VwpD+O5C2GNkTgIfBerUpcvokpWWIBq+kHJj7aHUzSd/lDjxUosCNj0
 71L5EpkzOcWWA2eqbh28E6V03iGXy6AD1axMfhOzvR7VgmQdFREboJkGAPPuKzUzjHAaoKBQogI
 0jcUKaRtZIIvZJLJa2LgKMpdyJl40stwNHYDv3xJZ//P4mjdQjNSpFGNw/Pevhpxgyxe/QLAgaT
 lkboffPFjGoFttQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: HtPQVBSP3PvgsI_4NYqIKCnXarqhtQjL
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae86684 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hTw9fJJfFBl441PWpkgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HtPQVBSP3PvgsI_4NYqIKCnXarqhtQjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXwbWUzAafrnCm
 YP8UMq54KXyYtpEA3uHajuN/3/QF2f6E6GNQH3tTyB3pB5epZCe8+ESuS6jAD3ccfLYImyULR3H
 o43ryBtbe58oWTEIMs3OjYGAVp46iYXg+YgdCx1JJY2J1+EA8xBiQdkUifmA5wQFLzSvsR1fqsB
 sVlCX6482ZzLu0R5l+Vw7HMPcMaaQLhkOki2ay8sIjDYXcX4lHI7g8lxepc3cGAzwLQ98yLNbp2
 /5NFVU5EoYKOkkshReqci233PXusYTgzg2wjunnWJaEFz2X0BZq3qn4QmAqnWg45E6YJK6ZmOD4
 IYT4gLVeatmo2XtTDlaVKNa9ZutK0EZ0tGIUvv3TOUj7mt3BJWhiHQ+w+fOe4fscq1AuLpJDvBX
 ZqL7X/hnbkib1oXosko0DzUgyXopaN/wZeZkUNPF7qmX7jr7Hy6SrHD/zu8AeTIieTB9M6lkdCe
 spLGv22Vizyvnnu6EnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX8cpj2Cou5kcf
 OlXLAV6TqTPN3SxYRR4jiwHVXQINPiMQUI4dHxQJJuUSZogkqDr9RKu0ytW3gL0lJYk0wL/TVwv
 cEygUI73OojeU94UIScX9oyikaeowE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code. The OPP table is added by
the SCMI DVFS perf power domain driver after being fetched from the
firmware.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 113 +++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 44a805361e35d9b34b9ae0bf30b0f8201a2532b9..2486720b9ffc8e7661ca3e109aadc6971abce6c4 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -260,3 +260,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on PM_GENERIC_DOMAINS
+	depends on PM_OPP
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 4b5e6640a6faa05715b96cc8e9512208340fb595..41f192c9f4182977573dc8755b34575b13212fd7 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..81bed5702bc17d2b05513122b22dc7a5cb75fa63
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int level;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	level = (submode == PHY_INTERFACE_MODE_2500BASEX) ? SPEED_2500 : SPEED_1000;
+
+	return dev_pm_opp_set_level(dev, level);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_drop_level(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_opp_set_opp(dev, NULL);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	ret = dev_pm_opp_get_opp_count(dev);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -ENODEV,
+				     "no performance levels available\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_drop_level, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

