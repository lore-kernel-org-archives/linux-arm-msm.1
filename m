Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC157380FFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140233; cv=none; b=KUW3hMwe2KHcx9+7vssc3s7ZPomPXDNjALUUiyZm/psh35WaNwyfaN4adZaVxHFtnHsOTrNWqiNx3hznGVLiqxbiKpq6GJU3bXHoA2kTomAkSK6yv1OPvOGVmYVc3zU0sR/X8vjxG7uBVymqKsBflpCQ3RdL3Yz0LqqptTdAZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140233; c=relaxed/simple;
	bh=IuAWYhrq8iC+CikdHI/e1ECe/txOrhjj6EPDSmygtY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRmosw2xnEEKlZo6bykst1vSB+7hPUzvFgoTfDy0QqJDFoF08YpoFGAowdNP/m7k5Nf6CIKT++22OR0vXyBRXNKU/SuZFbbQlttEN7Lis9QdwRvV1U8XHLmHRXfkwbmLgYMysSK8iSIccypX9hrFl9VHFwS1AElwQtDvaIbpy0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhMHT+xB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebtl2uT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhMHT+xB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebtl2uT9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BF91Xi170844
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mZj8U1PD25c
	E+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=; b=LhMHT+xBhFwTdV7bkSdWxz4EoAC
	z7U/u39CJNv7+23UyJYMvjDYMEGHhjYtseSJJci9B0nWGAImnllxhTjT0EANdoKP
	O0D4JBPXRbsyNibsjRLB1PDsU7yNh/QaRMmRbqfRkzOZZ1O1flN8oloWTgobel/R
	IZXEaxIvwmnbmwUbO2FFAb44stsRh+9EwQdAiFTWW4r1lIJOfnYoBLXOcc5Jfz6t
	acExdXWI4GV1osNWm9kSyXrS9jbH72IQhj7vmOCHuTfn55h8fGXsH0rp8Fyf6AfX
	9kEIFFa5/DRPc4fMAv7p4LQVQQ9KeWYmcZyeujF6e8i+L2GmhgV/24R4f1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm1e8209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:23:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78d25a8ff32so248412137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140229; x=1789745029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=ebtl2uT9i7AnRFi/Xf5/Kg9p+ykM0SpbjfpGjK1TISQhSX8wqlXj2gWxo6o/T/MYZW
         6i5n6iTYrbrzChUb1UM7Q0P4aS7l8SAH38gM+CoJIx3dltxqBQNbpZKTD0vgoSwk9Pqa
         PXLgsAShMJ10vajMY7hyYUT7KEoLy7yIWPrf7C12c2m1/Vmd99pnrdi2VxpOwrtcWYKz
         8wFGz0/IooQDUSh5tXc9G6m6jRj3W2vMkIrB+yBCVNHwGVdwtsaf3BgzxWP2PpdMuz7q
         mdOxnVVFHReCoZfQJXcQpYiwjEuVu2tsuwTsmWztJI2meSsa5Q3wcfrvGkMH8hEABa+S
         3tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140229; x=1789745029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=mQLzDBIYMV6f+G+tSkyDtFNfRv3UMTTcr+ULFdCqP2s6qyfk6SnFS5MT7e7bZtfdeE
         S/kvpYrZMK41x7yah+kSv2shCsZb5FCHcotq8SOzygoOypmc70qdGhKPIU5vDPWGNRLb
         YkhnGNn8EqbhotwUYalDnsuj286Jxr9ARtE984mm3E47di316b3EUsSXlcgV+6bYxJUH
         fPrLqxtKREda95o5P0TXW5jAd+0pkPXraSztDBawxheXgeq/BJQubdV5X0+BXDXA49ZQ
         nIVSkNMekgrk9LuRJ8QAcRa6Q/Io2NzvBRr0HdAkttEgig5z6mUL6vAe1b2+lAjNdecD
         agCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4bnQOiljy2ApYLk/M1F42YnGlaOP39+gOdcndCVmjvUYDSAmkEJC0TR+hzoB7CbxjWqo40WKkzb0+ZlFb@vger.kernel.org
X-Gm-Message-State: AFuF++lYP5oG5VpffQUdtIVYA7cqMKnnaKEAI1oEoL3Or79H7j2tQHxn
	FZXa6SpxHfa1sM0N0WBwywlsT0vYCfYl9fIe9Ma+Psk9X7TCyVJpG2zdmLp0bO4n6pGoedovIr5
	j+vOjUikm7o9AoPWN4IbL+ll1XM2BCCzEC2Xf7xmH81Ni6xJcLr/xGqhGNy0GR94OK/UV
X-Gm-Gg: AYBFou20yqmStA9orhRduUsk04x53MgfraI5fDHV5FnWLjpKP8aWCitxyA2Em3zZ7Wr
	/teLz1QrDSuvWCOcpF0d02MxSPr9hlSilEZ+qQzfx6EjT97kYylwa97rIR87Zi7xGwDUdJa+mUj
	HWmWVTOyZrFPYE3VgQD8cWNgJ99jJu2/ednTyqzl7Uhe5osOATOhzWOJ6Rq59KqNF3QxopK6OCL
	8gAIHDLUnXJ58kHircww2Q9a3miJireSp8U1Fo3mjxY1kKBRxjM1wwPM6Aj8tbXIn/5h/GGuie8
	4TXKhhIX3lsVrdtwiOObyaoXAjGB1kQb3GLghvXpegT4DXp6wzLU8aeoCqvPFtzw1oFMs5wln/c
	ol7n4XoRamgrkfGkaF+cTRmSr0w+u4XvC3sgpbxVOpQH4aOE/U4bOmilsR663r6UFWyy7iwMm3X
	fbtvHnJMN+fsn6jIYY6WNn+RYiKylgwW2yz+Co
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029885137.3.1789140228739;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029791137.3.1789140228322;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 11 Sep 2026 17:23:29 +0200
Message-ID: <20260911152329.5822-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX3tZalgnT61dq
 s5EOULSaRNtKTJhNRV+G+G7hqo5LTOTZ5Oe2124sfI7ZIUgzZqQfi+z37AqOXtc8YIW6EQEtshL
 0FEUn3PwgVXNkfLQUVo7mRUZA3I87tb+4q9siiLv6llz4IX7yIlctecx6NgAxPFmS3zXjnweXc3
 wXG+fi5nRGQEiyMhAQXOiirjZmqF1ZIQQ8BG9mXB22dPiTuP0VGserLzs5CQw+l2xoEoHvtEy/6
 OuHmiHVF9QPm9nGeJeQVULcsJWQ1LHDhaAlr9vLxMKhNBIyS7ekBPyU8S08EcYe7jb44v9k2QS4
 4bMefSKaOxpSS8nLOX89aHUOmFfPFVITTfYPSPBxciCAYL1qYaGTVud40uqEbk8f4IB5/C0f13G
 wDi1PNXtX/8H+ejlZTxtnphiKOXXqD5LVYhkj2FdsFybmhtJrSlRCPyS7LbshTKu2PYO072e+I9
 ANDsNil1/wM4A2bCAGA==
X-Proofpoint-ORIG-GUID: FBl7mBLmNY0u0sVIvARuxiP1uw7PSpFt
X-Proofpoint-GUID: FBl7mBLmNY0u0sVIvARuxiP1uw7PSpFt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX8FSu8zytWL9Z
 FOjxo4A2WHVISlqVperSRG66TJx1uU5V4vHxAWVE42oPFVJDpms9X7e4BLssOP7c9l09Nn2cSOE
 G8xUEYgrMU9YlQiHW+gsnkMThVckGM4=
X-Authority-Analysis: v=2.4 cv=LrwHWXdc c=1 sm=1 tr=0 ts=6aa41d05 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110214

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point.

Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 651d4ba06574..ea59dcd95b6a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -511,6 +511,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -540,22 +568,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return NULL;
+		return scmi_dev;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0

