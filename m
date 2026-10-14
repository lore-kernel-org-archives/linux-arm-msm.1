Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98B44EFFB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982993; cv=none; b=X+xt3E0VL32R7m6+i1T05XpvAC4fso+zwvlwAbOo/XyLCSJMAijntmr0EPtHYfiYODg1UaMSHBZOHPBSPiQB1r6n5j7Dsr4zR1msq41Hg2AL5aY4TrS4PmU5Kouz3Sam9p3pAtS93cUJv1jqkvqeTudYYunUAIJM8g/X6Fih4Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982993; c=relaxed/simple;
	bh=M65grMqA0pbQdU4QyJoVu4Bgle4ZA4GTDxdFGfP4iCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMXrq794uxoDJGGEpEDa1Q9em+MygVVBGZxPEbSUEYq5DV17iFBxiMDyjClhK07q6eTrBJ5iorX041Le0UvrNRXEoDQMIoQnZoeRQNANXWkKtxu2/AEIwI8jC+wss7kV6yfhj23czwtiV4ayzmVgeV6SaqbBmeUmhlB+1DMf8CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsuVTKBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+2gM4dL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsuVTKBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+2gM4dL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eEqF3696456
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=; b=EsuVTKBa+BPJWbGJ
	C6iV8zppThQzhk42jtzuOM242Lex5uB97yEBabka0Q/Xf0W42WHvDhq82FUaQAc4
	MpyH/jqWMUMn7vN33TZ7ZUJZR3GqcPBLgokQFHA0fYBhH+bHF2/C6WBJATq+RNue
	LyHNpTLiFwGo8KrlVYDb46G8NlgnIppAHU9MfSmax+e21cag1CgPvCIb2YiIIYoC
	nTAUoT6lQDXky6r+EL/4lQBbMt3PXA9AGA/6NvsKV6Ix6GfJap6HnHjS77aB25Qq
	Dn1CT+wBQERBdVy/5X/Lj+KLGPdZ0uj945rH+akIumPj6pZHcNxdRNUvOWEbnBBL
	eLa9ig==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aegrwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:03:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e94989d97aso1065489e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982987; x=1792587787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=;
        b=a+2gM4dL96/IjLq9Dmhvu5xmupifLvTsUEWgE4Bw6WCkJY9qrK0u6BCVXCCvgbCTuR
         zMypm1kBk8Zji+TrBB94v3pL/dmaobiVTH9ph8sdQA0Sxd1QoXqrDmr4P8gDmq4ngajt
         1lHsQS8hBnla7yfoBCIj7PbyMRmJ4SBCl2vzwh5qGzdljusVb2sYbZG9SQTZEHxl1T/F
         StAAegvXcvi00p5co4xZPpnAjgSHQmFJUx70t8fuEP7BIqDyaLfBPoJS59k8HaksJheX
         upEyPlhOOY7V46Zk1WJTpzZ6hTszYv9q0cje1kfAzcK1vwOyM9jfKjaYiUqgnMG51pBW
         AZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982987; x=1792587787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3z0cAL5rFgQt78BTP0aQrx2ojCO9AhS7BBpn8BW/14=;
        b=j5ASp7ofxzXQyFbTSAT8ORh1dJrmrL0T+Ru6xHfw92gyWrAiPXx6imOi1uTb0RM9mP
         /+tF8e1Mddi7xql7/zwes+ugjzEcBlVD4bZN3OjWcOQ4oB4RV7ZKIsVJbp3hm81S3N3+
         cMiyc2tYJrvAtzkFE1avfI05x8SpxZGB4sMMXmj8VkRdFa9j+ByZzPbuMOetE/xiD5tE
         RCFjbX6N8B3BihbSYRbrXh1OOGDLBL0vkazENxAdFCj9QDPIrR10ecijNQAiq/EYr++c
         rcil64W1lROME4i1RBx9FL+ApQqV8y0cN165XYHCMNBMLdW/58SSKvDsaQ5jraKaDyWG
         ihag==
X-Forwarded-Encrypted: i=1; AKwUvBzQbi6GEMg//7uG5IqII4U2p7TwCTEyEmoV1ur79VZX+Qh07jXeJevKgOWk8F+V+beba+mJcQocBA3Hu3Vf@vger.kernel.org
X-Gm-Message-State: AFq9FYLW4kK0DQS+Ls0Yl/ln2yckPBEcbWW8oTTcDreBAIvLi60dY0Ik
	3ieA1hM4p7Mxj1+tO3eV1sESE6pxkF2QIwvP4f6DVhiXK4y3io0iKcVvow/dixyOglJ0dGQ9q04
	PWTb8tMWvdWmf5r0D58dW3h915UftCSwVQRjDTjGT6WWKtxwza4QoF41ouyb1S2yy4jBj
X-Gm-Gg: AYBFou2KVQ/HNPRs12394p+uVWJ+mjflH1gev6vc+d3rFq9+9AcSajyrn0dTndF7TZ7
	HsT89gLIAlQd+XvIDDVxblwYZ47LntIaPH9/bjLKgy3kNrpBgkyXZn9YduCnqUA11G04FreFoMz
	9iC73QpW3xOgDH+KU5loJ1ogBXl/j2j/6K0YPrktJD+MbzydpcfgBYvx0zWEzN1FgSwgKStGsmF
	P9hlNToEVxkNOy+TP7mJqOLFKxS4+mnaeDtG3ZmTQmCrgsMha+sbNpREs9GHdNe7cAr99M4euwW
	VKidJrzVW7PYW5h4qB+kcJjOc4YQV53znvescS7KcUuNEIhQoWgBmYsHmDEPDGOplrQlPBoEUjp
	bhlP6C9Y/1g==
X-Received: by 2002:a05:6122:1828:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5e91f46ca9amr4660009e0c.5.1791982986707;
        Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1828:b0:5c7:a9ee:dcfb with SMTP id 71dfb90a1353d-5e91f46ca9amr4659950e0c.5.1791982985578;
        Wed, 14 Oct 2026 06:03:05 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:41 +0300
Subject: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3010;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=M65grMqA0pbQdU4QyJoVu4Bgle4ZA4GTDxdFGfP4iCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz317IP/RgPiFebMABWgpRQA4kfAxNpiWKdFo5
 nyL124My0aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99ewAKCRAbX0TJAJUV
 ViGxD/4n6SfiXmZfYHLfCeUDnUW3mv0CjuulX8LDaae1+UfNKgq2D94MKSPHAq908uFKy8M3ACS
 8DfA+SIbA95s/9QIamiIEZJhTyg8TpeZbzHTi3lj107xrKggAI85FudtTGjV9P4SaWUJNxR5IrQ
 XuCckMQWmRZesiLQaLZyZDrlUZEXVSi7kFEfw8aQV0bUwFFxe03NuxkfCONUipyohb14bMOz7+D
 tgTn6EO7LKZosyaY+4bnhyi2iueZEteOgPN7JC5dd5heheXIyhbhpR7m/gXQ/i20Nr0Mzr+IXSR
 QZmzceVn4hdEW/37uzJLcXdKtboeq2ONnycBsL2mwY8iMdH5ke7urm0DHXSktdl32F5bxHvsT8F
 orvrvmk6GSTuZWdKMr2YAfyo5Gyo1nRfRrr2dDUle4fJTJmFb3kiKhTh5UvunPj2UpVeqmXuJcJ
 d07Q2lNWp+wH87irkbyd7cKFJQ/WkwTvmacXxpdXe8wIqvriDLwsGG+bYzZUyPLbF73JtHDlXB3
 lJVm4uST7oRbRxr53+f9xCWnbICzwnmQmE6967SUaK+TL2gJEEf5zdhL3XTmc35je/Jxhq+FT+W
 EurMZI+mGnTYvwNTdprUK2sW4/ORcB6j+wzmndEhnrwi55cgs2wbJKsi4tlLroyV4YOkxJSFvap
 EaYk+c/iAwqdZLw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: rggR2jWfnOZG7hCSVIV_DZfeRWzupTHh
X-Proofpoint-GUID: rggR2jWfnOZG7hCSVIV_DZfeRWzupTHh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXyQJYJg21BJ3e
 IJaaRaa3sNp6gQNLS2Wk4HfZnuxvv7s2gW+zA9PQs8BxYuSqwe6zra1NpDjnlt4K92BCUUrITe8
 loRfvMcgMl9d+3bfYVKQkwtCXiRZcPw=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf7d8b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e97J7Y3cOKKqNyIg4ksA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX1XvxzkQ+hH4n
 qfsGzQPtsVKXI3EGl0cpgQalHPyzGmXtyRUSqH98v75mz4pHxSYqMraiEFcxp7o/WpbJk6CyYWE
 7VEkOcy/3df88fC4xUckX/nlDlm7T9ZOmXSPHZ+nMDfrX47hDi9sSqE+0UrdqldA2iOBlBz1dWu
 uzxncYMshIjIeIEsOTDhKI+CZVCP9MQKx6u1i2gdTQ+LAaxHbV2IJwho59HBn3v5UroC7yZ1DZq
 8d6QajeltfgnsdpDzxADSCn4WBix8AheejmD3ZtFpRhpTuZkZSCpGSnwF/jjtzBBWYCCvpgTxeD
 bFNAsM+W0vN6XEaWWcKBcZu6+8dwmBltpsUbOBqN6l7lh/itpoDTJajDc+jC6XgPH9E9/5X3h9h
 P88J17j5RfbAg2bYnRNv9QQo5OrW8v/uFYdDozfx807nIX4310JypU7esBEHr72Ou0MLLzgzsTN
 byL57XXD/GYwjCVJc8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

Read an optional Bluetooth device address from an nvmem cell named
"bd-address" (as already supported by hci_ll), and program it into the
controller during setup. This lets QCA controllers source their BD_ADDR
from firmware-provisioned storage such as a UEFI variable exposed via
nvmem. An all-zero value is ignored, so unprovisioned storage leaves
the controller default address untouched.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2..b704f4c3e1a4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -230,6 +231,8 @@ struct qca_serdev {
 	bool bdaddr_property_broken;
 	bool support_hfp_hw_offload;
 	const char *firmware_name[2];
+	bdaddr_t bdaddr;
+	bool bdaddr_valid;
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
@@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
 
+	/* Program a BD address sourced from an nvmem cell, if provided. */
+	if (qcadev && qcadev->bdaddr_valid) {
+		int berr = hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
+
+		if (berr)
+			bt_dev_warn(hdev, "Failed to set nvmem bd-address: %d", berr);
+		else
+			bt_dev_info(hdev, "Set bd-address %pMR from nvmem", &qcadev->bdaddr);
+	}
+
 	if (qcadev && qcadev->support_hfp_hw_offload)
 		qca_configure_hfp_offload(hdev);
 
@@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	qcadev->bdaddr_property_broken = device_property_read_bool(&serdev->dev,
 			"qcom,local-bd-address-broken");
 
+	/* Optional BD address from an nvmem cell (e.g. a UEFI variable). */
+	{
+		struct nvmem_cell *cell;
+
+		cell = nvmem_cell_get(&serdev->dev, "bd-address");
+		if (IS_ERR(cell)) {
+			err = PTR_ERR(cell);
+			if (err == -EPROBE_DEFER)
+				return err;
+			/* -ENOENT/-ENOSYS: no cell configured, ignore. */
+		} else {
+			size_t clen;
+			void *cdata = nvmem_cell_read(cell, &clen);
+
+			nvmem_cell_put(cell);
+			if (!IS_ERR(cdata)) {
+				/*
+				 * Ignore an all-zero address: the backing
+				 * storage has not been provisioned.
+				 */
+				if (clen == sizeof(bdaddr_t) &&
+				    bacmp(cdata, BDADDR_ANY)) {
+					/*
+					 * Per the device tree bindings the nvmem
+					 * value is MSB first, while bdaddr_t is
+					 * LSB first.
+					 */
+					baswap(&qcadev->bdaddr, cdata);
+					qcadev->bdaddr_valid = true;
+				}
+				kfree(cdata);
+			}
+		}
+	}
+
 	if (data)
 		qcadev->btsoc_type = data->soc_type;
 	else

-- 
2.54.0

