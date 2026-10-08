Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D63C552B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440670; cv=none; b=GjqkxEhfFlzn8wwe4YfpyLgCBWBgTDiIl8JfndmmLd9g2+8pY9GdL8VCzGz7Tok0WUFOB0JhGzYjy5B7PWFGtIgWDvxr3MrDqPKJabSp7pxf+inTVfbH9W4ztkjFt61b6+a20rOuBzQ458AZCOVlXCNV3Rb+2n1xSsqYgvSQJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440670; c=relaxed/simple;
	bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr6yi2O1g80tKAbAOQOC7q2FZZa+VLwczJ6pExaoMwI5ynbKvslR4ImBrQoeWcLHd51Rtao5TJxIXvIL3OHT/KDJT1niDdH0w5jPp8OeHF37LQM1lcM4+806RlJ/7Zv0sem2hTOkff1i5AfK6NYgcdHPX2U6YFtGkMB87gmxA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evcTkvsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdOXibhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evcTkvsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdOXibhy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BeGQ753999
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=; b=evcTkvszK+8U31jJ
	ku8eUG7knSKpAMWE8bRHO311PA3pCziQipIRWzLnodfqSvJuVFktYYKncxBzIvUl
	gLDEZe2LP5GWc/pkRBZpMNOjIu89q2JVzssEjgc0ApQsyAk3DHZZQOwIcympLD0b
	kVa7NVF1tAu8hqsGimVBWj/loMp2sXzFNEaQX4i76qj7ZBlpbUNMjHdYpxialLQY
	xxe5ArNsgIGZYnChYDd4PFHlrcX1A7LxL9mj8o/KRyYJEmAmZ29PJo5R/8mLWqgj
	DCDc8qFzEpAY+xLo22eEtuyXowfX++2XM7L7UcZ+9Sk41xe0qXQPuNbWtwDx21nS
	FdyBgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39d0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:24:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3929930a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440667; x=1792045467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=RdOXibhyWWFo4d+hKuz01Fxe/cegPE8YX6/avh5/VdnUJ0zHDsc1ecPje+YLhgxPXz
         qtWUaIXLFBnBdoF1qbRY2LJrhhljfwUHzEm6c28o5Z8jfaP4VjOebSmE+tsrpKPLLCnX
         zEWbmSY+Q/xkA7Gn1+GsKIErGmaHe1xNxsT/lEeAkNn89LZXrCsEsm7mXwBcEYw2VwPi
         u9K7EBLZA3r78aoznDyUo2je3pzKZvBPdNNY9hWM4T+CepYpcHVkSQht2MD9DpIOzA4h
         XZU22QNqmrIS03c4HhQRwrIHfykECGuJv7ZUgNjBAE1a5Ev0OnL9ekL1KDgU7pYfwZlI
         enGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440667; x=1792045467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eS4PvSA7/Ma74eWd/k9oJLAImFrqW7ASvtLawTHJBjs=;
        b=r5BcohZkvPsIPU0PaXsHQVrozgv0lgom+rJLhugce88EH249Qkurq6hlMqT0ljqXbk
         NoGS/gj2rC2HAyL/ahh6cDzQhV2wAnCuhJdl8gwGTOZcLzhkCB7x2/E1VjV2zBAhfbh5
         +LF+wbu6Y7eflTEplLv9nPIyd5sVJpaTK5aasDBFm+8gLdjdqH0a+rum+kv6e1zhpo9F
         EkT0y6ABFY8ZCP2Q+a7ay9c4Gp9J84Fvg3X8ucP49m1RC2XV+L1vZHFgClw3RyR786nc
         J77f+pVblY8U8TPyXv/Ava5eJKCGBLCc/oTtk+aDPZefZj0CRwRKVqlWmmzR+kuUmeN0
         0tPw==
X-Forwarded-Encrypted: i=1; AKwUvBx/HS3HPdyR6ypvmymVpxOD2W0WfexriPHOGG9cQaCXPeQJHBGkM55xQgtdDuuaA3z1Kurs/luuyJ35+c1t@vger.kernel.org
X-Gm-Message-State: AFq9FYJWVd2TFKaq2yMeVGbyJcOSL+y5T3v6OsCuCmQKVnUFlZ6l1B+J
	EgG48CWfaJbC8PqaGArq6pULL+biMSnCLRdW7s4bCkW72FvGh/YEgUb8MSj82dvjR3EbJVISxa1
	YY6OX5V0ftdYv6VtcgzArFzFBUHLWjNSwDJMbtYb6sIvl0R9ZR7/hieV0PZUtuh+LgCQn
X-Gm-Gg: AYBFou14jpE9zcguThR8M7C2bQ1fV+AD5H3NFTOLgeZql1qykRM9gzGNCr44CfgGUt3
	b9NcC0q9px8Wy5sCgC4SA34m9KrE0zoVg+vpk5OaVrz4Q0gi9SbniKgS7E+6vtKk5GXJKT5cFoI
	X08kle1w4FtHHEec+g9sYEAusK5Jlod5tHgqoh0Eub1GCGmsAajiOJoA2uV0TH/kjM5sk18SPwJ
	Wyu+uzLNGXMuSZxt7VlFqVoxzlEzH/NfF5olk4suEzrSaQ81oCw+WBVxX7i2hZqR1dVtI2gS2/a
	IKEsvoih1GNzPgZkclvilGK6YjyK4pl5iAyBUowRRaVhOAUvJ05ut6MLwzZG+HBN4Na703Dec5Q
	HM4YuqOU5VV5iDyOrATMoUCpXS4MF
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105658a91.45.1791440666891;
        Wed, 07 Oct 2026 23:24:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr4105630a91.45.1791440666413;
        Wed, 07 Oct 2026 23:24:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm2767618a91.4.2026.10.07.23.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:24:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 11:53:51 +0530
Subject: [PATCH v7 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-sahara_protocol_new_v2-v7-7-90d278bd7414@oss.qualcomm.com>
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
In-Reply-To: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791440631; l=5210;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=XVetEM5Q2ug5nyBqvhNaS/084gMekcQG8SGiCqI6YvA=;
 b=XwGMCYWzlGTsjAzJeyIcI3VnMQ7Gv2772DSFZeD+o6JRTtp9YjGcLODcxasJ/NPHil0Hp/nRa
 XEkzdLU4MUSCax5CLl3/wd4fJbJlZHVoEzE2OFoKpXGO4EqpVFMmk6M
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: zSooScwBLnw7rsmD6VYCyp1MLP7IolcX
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac7371b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=W7Sg6yURm1IBNJFiFuEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX/6lPm/0vdMb6
 jgdsGxQuoWbJsvFXNJWLXn7h1s6/GvNzpRMkzD492q9v02QbkvR/dvjdaPIgGuTS/AuePqT+Ygs
 r6ZkDcOfgHYn4z7J9Aj2GUvG23YkusM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNSBTYWx0ZWRfX0xhTv6ziLSjG
 fiEibxoy7ZDxhzcCFQWSEu0ANOJsL8WWCDBdmYXpCPQ2EoJWbbcAcsSmziYfhKUTT4VUK85rV1U
 rlNStGq2lJMzCFd8pqfPoR7SKRbFZ7X6RySaGccld4zWigbMdqff31K3kv3vNnHLQ8yFg2WizjH
 1QYnDJAPPZm9dvZGWy6iIxCsnQpCKjvQpRqRzsI8e68SelAbjqkPWsZ+nSOxwFObX5XVYQJxaJe
 57EEKvpqh/z6de0CDyc7loM4frC0qsnWWlfF7MWYMXhGEbVQojawZhQxk8hwb7EGSGpc6DrFsr5
 CwFsIYuCWe6JoNL+Wdi4S4RPSsJfrh3iPGmh6oGzrQ+L/aTNtLF5Nb0BKohGOBb/Q1w809K35Kd
 RhDR5sWNGTP8kEerw2jWr1I7YdVDFu09pwjqAm57YV+UdEaAUJNcX4odnDP6G3n8OFgOZS6Bd5w
 rxSrEWb/UWdKUxwd+3Q==
X-Proofpoint-ORIG-GUID: zSooScwBLnw7rsmD6VYCyp1MLP7IolcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080025

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 +++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 62 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 11f65cbfa66b87cb6f144eb096f96773621978fa..2f2d18e4ed4da4ab023c8d68a5e69abad0480555 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,66 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+static BIN_ATTR_RO(ddr_training_data, 0);
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &bin_attr_ddr_training_data);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &bin_attr_ddr_training_data);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1130,6 +1190,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

