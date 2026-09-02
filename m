Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1EF38A715
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372541; cv=none; b=miPKYuH0hfoMJ0N4S8Wbynorxc+0oRXwnWj+frmHrEIxNMiyciGcQD+FxVWQdGEMJBecM055rbtFh1rVeN1bCTjDKfAa5ehsWJTFnKHkNBNHN2mtGD9MKhVnRuGByF1u93bWMhsYehcLpQPTdgO0ccejT4rL5tPKrddhPBBE678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372541; c=relaxed/simple;
	bh=vs/zkZkBqDGWIJOv/e2m5e2aVz+VFWJKG1MOOWJTS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7DB4HmJrG+jwLOVTvgHmBWhMYYGgdz+1+8bmiWd3jGpBNAk62v5K1wZYbJmvmsMBetN7vA0USLlKBGAUbl637dsiErDoN6sk/VLE61fCIxhLcn63aHu2/+T4nhD2XYNzLFLUX2I8I9RrrIlh2MAxk70ZVE9FuCaRgAO9V00MoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxS6P7SL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Md8bIJIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxS6P7SL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Md8bIJIy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqnmb1586062
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 18:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bbORKfBAEcY
	HO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=; b=DxS6P7SLUnmuzeNOqzF+4g/zJxu
	Ce2GUi0lzlVVbLVCYigkJKHMuQZCRp411lPCy3f8HAp4JJ7J74PFJfi5NjXp9peI
	Ryus9hn6rdlRnFw+PdD7Rj7AhOFxeXKLxxpExLLzmdjzoWjz9XHQ66UNquuTn6H/
	1TrFa94LmcwyCA6MDaT9uHssmcMH1IUYYOQk4zU8ZLLmAOe/PpUS8l1UciAcNcer
	I0nMGjUHGfkbk4hxBgKikY2O2uXoRezFF1Iyxpd/3iAEnFAiSICxf0rlswxNkquT
	84rUO5n6Awh4naqesajSsDeG0EpfCHZYzIDCqG1IaIevEX8GGxNNnb/9VUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01c7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 18:08:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so322297085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372537; x=1788977337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=Md8bIJIyTQuh7aNdFiIvfKXCnZrLtop7r0kkLMY23/EtXlER/8EYMSb+8amEm4IYhA
         kW5AhXx5LH7yKdLbkbjQZrn7r7z1QjS8szMthDFRJ1Z/MJxRVmLeDjEHM47GFigWQ/o6
         AewZjc+4Okv8KD5u7XMtwxJj31rxgO0o/L15GqJfLSDdfPWtuQ1BNH9vmOZMYgNIeSqg
         0RhUhbD53bAQhY0IBJ/YDxts+5x9gduV37iSQabBBCKVPvnqv4WSCydMnf6i/w98O9md
         a7ljYGpVKeruo0ABK4pT5MqeBFqZcENGpTvpBMuRANXw05aKLysJDYAd5hiNLT4gmVjI
         Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372537; x=1788977337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbORKfBAEcYHO2qsqE2iCDgdtjeThGNyWZmtJvMyYf4=;
        b=Oz/4RR7t4GypZ3NOKTDcoL+1nhYGZAm3Or8fQOc+hn5DUokMeq2m0aMXWylwKIiAYx
         BbK5bXKBxTTdYyJkpB69OhA80e2fPvQM+u/8k79QRacjkIA6yX9usJEO75PopjpFpDJY
         8R9q22Q+8AijbYc4zWKYQeWH7XBGKJCuW0d03cx6cqPq5wBEE2C0RnhkLdlyWqdy/0Vi
         gF71sA5NVCPE5BiOsrlrggEnn1pUdm30A79h8ks4iCJ7oALhsCecunpIEB0kpFcFAm23
         y+Z30k+MO/NnE/KBmnOz8fA4wI+RXMMyWnD84SLHhf2S1P0p768pTDTCOA93RMmXylf6
         GnCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+cizK4Gv1iiX1th65h8+lZxJ8oNNOhS68bdG+fdERDwY2GBHX+/j10Jyy9UielqCnMcD2/h+1MpMRy4OO@vger.kernel.org
X-Gm-Message-State: AFuF++kf6HarIszzKHP4AnEjL+It49ovRoqqdgit50kv4hF9RHPhDlZh
	AKAn+NSwLowk8qNH6veX1lT6SnNsNhlKdQ/j1jg0f0NpAQaSBRjW0VBBkc6q5PGqt++B9YVzerD
	fJzZcSVX5jlIzzNys1WaYkS9EbAuIPkbYVEHZHman0rI0QSC+QuU3EZHIS/mEgC8wOVtB
X-Gm-Gg: AYBFou1Mh69Rp9X+IjnhtLu7cwdtfh5CJ1L1F6sFHwHxZOBoMWx4wL/j3H3l4QxMToF
	KciKwI1kb/9GE9Oo1uWxnF374OxI00y2UhLBv6np6jJy06gpgzRW7GlJu17CHBzN6rCrQfr6E7E
	ElX3y98ull02DMt1S1WOlnRpdb5x0GRIWbAiX89X9JkgIXPd2BdZ3jGOOP3kPS5ryd1H58HIkky
	U7ppnn+I//cCn+dhpQooPVqBWU3O9NxwU60BdcM+gJxQ7x1+5rkTU/jq16kTmuE3SePFxzp4TGS
	qEAqYduQ+lP/y43j/MDucSEAGe+UBX8NHE+yZnd/jXUu9LjblwI3scj2rvHKnK0mF4mBRuccU9o
	Nopp5EvNwf6UHx3Gj8pOGofWI9RmmfUdnvpUyim1e72DdrBymKWV/SSaK60HWycCTzAW/+jWTOK
	dmfzWKxIrk8gdeuUI=
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820787585a.26.1788372536895;
        Wed, 02 Sep 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:932:ddff:1241 with SMTP id af79cd13be357-93960efc6d7mr820774185a.26.1788372535857;
        Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
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
Subject: [PATCH v5 3/3] firmware: arm_scmi: Always create devices for standard protocols
Date: Wed,  2 Sep 2026 20:08:44 +0200
Message-ID: <20260902180844.41230-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1NsAZAdeQuFjaIZNHebsCzMVWxpfPNjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX25br2vzSxaDE
 6gMZ7AMecgjaS0OsURqSdBidSXfA+u5H/tQxeObyiPoOrOPhoU9oYuhgH536OzmKze5pRdRN8pG
 nVBa5+M6oYvC7jUuamWHwW3RwdlQQkx2REO+vHmya6IykbBADq+q9Ky/S9t9MlFdUbSzdZTV7gb
 Ec/jv6nCuyURg/ZDRyM9Nx+JrenmUMj5Oal+brq05Mgh4nQN+vzYMoyo6TU8j0ZmoyvZv12u29h
 X4iFlETtB2uO1fD4Vu7fXBsLRYbQtaJDYlQwfT80zXupRY3DXU66wcWc9Rimwne6yoVKbDgKXmm
 Q8LXW1UYXFEUpwKIYG595CG3W4w/iUvJHXuQ1XWKSv8z0dHaTgT57fowEQGv4RC0VCxytNxlf7H
 S2pkec+0HIF2v0kbVJ43z+3J2InxNX5F3z2z9L3t7JYmM0iL7qIdGCZiiFYDuSYnoEoW96ve6cC
 dAUU8BXkU7DC5X69YBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX/uwVKwBnwFo7
 8GXXLymGtmSCwitjmaQFWlr7qweN+sGBBQ0eK4PxSABVMJfl//XXfXRo68w4yZ1c9KZAGTCdM+A
 hzZFfgdq+GEJ0NYGThQClpeYbaLdD8w=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a98663a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=9VS019lR99HtUmLVNGAA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1NsAZAdeQuFjaIZNHebsCzMVWxpfPNjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160

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
Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 48 +++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6f667e4ffeed..10d15da76f19 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -505,6 +505,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
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
@@ -534,11 +562,25 @@ struct scmi_device *scmi_device_create(struct device_node *np,
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
@@ -549,7 +591,9 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 
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

