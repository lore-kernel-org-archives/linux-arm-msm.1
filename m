Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430916;
	b=0K/PurS9UrQNzuNmW5/uMPEqw1alyRVdbwWCZY6pKxNAAv3fGboznrROHM1O3Thdcib5
	 PqcPm+WvULdyHdM1+MqQ+bE9Ss9J14qx84/HOLGqs8UKwE1yjfXUFS0Dk0Gwr12Pg+V/a
	 cFfHfT0TZKGvHpXF3CK4CtwMpA0Kjz5NNrqUQVxCDt6CmYWBRA79IQvNcX2onO2je1Ot8
	 242eeHtqFqVzd9/paaZTFcagRyNG8GTzAEWN51ZhqOtLlKau8P1ICP8aFbMoWrHhzfX3G
	 3z9vhCRlgDH4EYTPTB2nQLJCbX8htAfU+H4U9WWYZVALJwtuN4ufjSUdZzXueKpECxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wwywJT6/g3sN8gddk+JAICfeLzuhL+rR0ojhpM1lXdo=;
	b=TDLFIkk1l1X9ysClbVTsdw2SxDBjnbtXnqaP9widhARSAq1ghgnQcE9DBoqQHEZZ1YLt
	 ulm7JPg+57q9v8fElKJJynir6SB4x07n7e08KwnWg+eli9bKVulOW7uCfwla3Sk9uyOca
	 LZhMhxa3kPvZxTYPVrtz6qAaVb3hb2TGuYCjGC07fXGq7JW8hS3bZYTL999aFr803bO1i
	 rcYzaUQXVHHYnYCjiL2oqMJUa8NzEnlHa0u2FCemOb1cBSJOXeuf2DnddFYPMPCZnQHtG
	 dpN9jUEGQY3XsBXS0sNi3VniB41LU6+ASgIwrsJA++uzxy+E8jgSnLXAEevSIFJgNhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbIHEGSh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ju7M1Mvr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE7606A681
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3FE7606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fbIHEGSh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ju7M1Mvr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G7lC4095715
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wwywJT6/g3s
	N8gddk+JAICfeLzuhL+rR0ojhpM1lXdo=; b=fbIHEGSh2ZYKk66068YbBawSPt2
	nqt31mk/LfLnD+YhG977VSm02q89b+e7V1MScX6LgKaO3wBtwpKGkiFoQngDEaHU
	E+jUCVggZ2QDD3wWVfS89sscxp84PKlQhvMex02s6NuUkbSElF6yxFTTx1VcXdtD
	iwFLNBXKn5cTYtqDKE+c1dr9aoX9pSACJ/S5BNFyLGuzg2jnbyh2Myyj58WQnT9N
	nyEsQasyMC12A5KC2cRsrru2RoZu1oXxq2R9UswPgHe806W/FwpNhc5gCBgY2hl8
	JNbY1P0D8Vl+P0In3HiWDJmn1S0J7QCy/dywu62O5wcBA2v3N4MefxQag7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7410m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8c5408e418bso2281116b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430914; x=1796035714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwywJT6/g3sN8gddk+JAICfeLzuhL+rR0ojhpM1lXdo=;
        b=ju7M1Mvr5WooDzyehSWjOhnXgsN9m6a6eEjh1LRsWWefrgyB+ZWn6xmwLqmbf6RDm3
         S8dGwNWXD7Sws3+GSxJ9dju9isX5YWnXvQGtnZGryiZ7CO9WicJ2H5ZB+miMvGenx1sL
         EjNEKj3P8CeNNLUwqjEbQyS0ys7YDwHc4EKmBDZ5AKBYpDTC7t0I4+JyQwRBmb5YtJIa
         p+ZF4XrIqPFUAfukXyfcSnlStwb5LUkE8Cc5ytXKSPOipP6sLOBgCL55fcptEo7HaMAK
         DnfvKkMDRQ5e5pZS5jBSK4FlXdEbQaR/cCnVAvn9IdCuvUtwpDZGijHUq9navnT0c4HL
         N4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430914; x=1796035714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwywJT6/g3sN8gddk+JAICfeLzuhL+rR0ojhpM1lXdo=;
        b=u9MkQl0xxn0SF7hV/Mi9Q+K7FGFlsjsgvLmCa+BAefWXxAq7tE03yy9jMlOme2DC0b
         E9GA8m7IsgXs0js9NoKxcYlBBJnGcKwZ29kwcvkmkrvfuWolANruusRjTM66xRjIiPwx
         6H5r6fNcJ2HFulwqMqgwLb/xR9WDqDHoG1CpHoJebG6DS/vi8jf6wI3o8Slp4R4pUIZQ
         EbTUzUvsxrbu0JWk54Mcpqs0INXqoZ0x9eZkLo0hjNSb06p3SyFuQfoqhY7PRWF/18LP
         NsmFaphIcnExU8c+VKw6vef++bhUqpacraDqnmQV/gDz3J6zwK6nmS02ttWGSKOd4Hbx
         0Viw==
X-Forwarded-Encrypted: i=1; AL+hErFp4HHpmGaKqOJYShdBhGpZ+ASd1Lv0oXwkBWC8VOllGzfsjxFUvNc75tKtB0FpWQDM9d0an+4VgJYkaq4j@vger.kernel.org
X-Gm-Message-State: APuU4Z+O7x8mudLQOuJZ2m+qQFqcQnbBPwKF/alLZx/jmUuahbjVSgPG
	s5cKEqz3X9nXwZfcVuNKI05EXFjBDHHj+xUC3UzBttFidO0/S01LUROS5r3rd4wU39bgi7+rkmE
	qWHoR2edsglYl7tqYgoqvBYZPY5Ri4DGTY/SFbA8N0VYCLs16TqBF50i6PKgedoepvrCB
X-Gm-Gg: AZFdTZcdX47HazTSN8Y/6cQ+EqBZV2/X8yqMqt3oroZu1tnDtB4w8aZgMLXF1F8A6jJ
	tpstgV4V24/SkEwRd9XAi0Y7uQ9Dce173qPra62DxQWp0XCxt9TQCvpZRESIPsB6sjb65jemJIE
	mLXGZAyialGxYXJ4B/H+UO69kKvweK7gzjDrSI/YyRyNbuyZYgWtUza10nNBpMAkk9eRFzqpTtf
	fVK360vJo53203gRVpHf3QqZqLeHcOoOD/dA5LqtMNhjDjnGOlgvUf1mnmvUO6Khbfie3xK3MCG
	NUHR6nNthTjoRmtsKL7mrwkifyd79SbWDucBWMTC73SRafb6CAOojFynIrj90Eln3JB79a9OcPt
	FHDiLII3HNI0cRLJOwX91GM/Hjep9+qvk5Tj8HW+77ouDYsnSSy90G6jU4ikJHHt0W9ypwUJKPN
	oTmWQcHA==
X-Received: by 2002:a05:6a00:188f:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-8c87bfa7677mr9566138b3a.24.1795430913382;
        Mon, 23 Nov 2026 02:48:33 -0800 (PST)
X-Received: by 2002:a05:6a00:188f:b0:882:1b4d:1840 with SMTP id d2e1a72fcca58-8c87bfa7677mr9566128b3a.24.1795430912834;
        Mon, 23 Nov 2026 02:48:32 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:32 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 10/11] usb: dwc3: qcom: Support firmware-managed resource states for power management
Date: Mon, 23 Nov 2026 16:17:25 +0530
Message-Id: <20261123104727.1539149-11-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-GUID: cyc7xd1_ZPvpAXdJLqu00P_aIGIzWdx3
X-Proofpoint-ORIG-GUID: cyc7xd1_ZPvpAXdJLqu00P_aIGIzWdx3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+2DLES5XdxFp
 TDWtbI8lMqqh12XshBbinnizxtIH3Q7Wy05CiowBnpNxEQfIC0ZAD+Tnhn8bm8jH11Hzb44LBjb
 9vtAXBwQw7EKTWsTlbF2wl6ZvE+cOOo=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b041a02 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=E4PWLy23ICGMF0Juu78A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX77tdOgmoluHh
 PUKBVZuOOzemlQePHJqh5+MMNID3cxUmslD1fSuXoNqwoOExNJ9xJvAsjVl9bWNfGKJpbnBPksA
 d+grw0JSZW3iAUGKS28EGwBoHhARpEBfkk0PPJO+Kx0YQQX3/9WFWYo8vtGxiuHvIfdm7ZWl35m
 mqSl7cQgkRAxAvSi8W7m563ZH8aK8ljputWxXbSpWX3sSL26XmaAJyHIkLfHsXPgOcp43LxEya/
 0z7p0NVTMeUTq4Rr8OfFfVUsWhGK2H/Yj/ht6sBrB8RKgUz/YdDFDWjAXQCwGRBTctl7bLfO17x
 xjX/rAdAFRYUwspY/3tBIDhYL1quCnOINiyPNYGgjGNGXNoi3qS2lcCK2QTxt9L1kGY5Sv7S/R6
 hBNudCwnCaSAtoNy8LU+bQ8/Yum3JG6b94sRG2Qkkn6r7OB60h+JmGzcRD48ihLulxLboDFlpyE
 OfFYMafVC87N/oornPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Add support for firmware-managed resource handling in the Qualcomm
DWC3 USB controller driver. On platforms such as SA8255P, controller
resources are abstracted and managed collectively by firmware, and are
exposed to Linux through SCMI-backed power domains.

On SA8255P, resources such as clocks, regulators, resets, TLMM and
interconnects are controlled by firmware. The driver communicates with
firmware through two power domains:

  - "power": controls power supply (GDSC) to the USB controller
  - "bus": controls clocks and interconnects used for data transfer.
    Register accesses through the controller require the "power"
    domain to be enabled.

The clock and interconnect handling in the suspend, resume, probe and
remove paths is moved behind dwc3_qcom_resources_enable() and
dwc3_qcom_resources_disable(). They enable or disable the clocks and
interconnect paths on existing platforms, and vote the two domains on
or off when the resources are firmware-managed. The interconnect paths
are not requested for firmware-managed platforms.

The domains are voted on and off directly through runtime PM, whose
usage counting keeps each domain enabled for as long as it is required;
the driver does not attempt to track or infer any aggregate device power
state, nor does it assume what state firmware or the bootloader left the
domains in before probe.

Runtime suspend/resume vote only the "bus" domain, since the "power"
domain must remain enabled for hardware accesses that can occur while
runtime suspended. System suspend/resume vote both domains.

If system suspend is entered while the device is already runtime
suspended, only the "power" vote is still held, so system suspend
drops just that one. System resume then votes both domains back on,
which keeps the votes balanced across the cycle.

The domains are attached with devm_pm_domain_attach_list() and
PD_FLAG_NO_DEV_LINK, because runtime suspend and system suspend require
different supplier states. Runtime suspend releases only the "bus"
domain while retaining the "power" domain, whereas system suspend
releases both domains. Ordinary device-links would couple both
suppliers to the same consumer runtime PM state and therefore cannot
express the required policy. The driver consequently manages the
runtime PM references for the attached domains explicitly.

pm_runtime_put_sync() drops the domain usage count even when it
returns an error, so failures to vote a domain off are only reported.
Failing suspend on them would leave the driver thinking the votes are
still held and unbalance the next resume/suspend pair.

Enable firmware-managed resource handling for the "qcom,sa8255p-dwc3"
compatible while maintaining backward compatibility with existing
platforms that use direct resource control.

The probe error path now disables the resources through the common
helper, which also disables the interconnect paths. Clear the path
handles when dwc3_qcom_interconnect_init() fails, so the unwind does not
touch handles that were already released or never obtained.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 244 +++++++++++++++++++++++++++++++----
 1 file changed, 222 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 61a3e3c38f59..559de5172e61 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -70,6 +71,7 @@ struct dwc3_qcom_port {
 
 struct dwc3_qcom_priv_data {
 	bool power_lost_in_suspend;
+	bool fw_managed;
 };
 
 struct dwc3_qcom {
@@ -92,10 +94,26 @@ struct dwc3_qcom {
 	enum usb_role		current_role;
 
 	bool			power_lost_in_suspend;
+
+	bool			fw_managed;
+	struct dev_pm_domain_list *pd_list;
+};
+
+/* Firmware-managed power domains, indexed in pd_list->pd_devs[] */
+enum dwc3_qcom_pd {
+	DWC3_QCOM_PD_POWER,
+	DWC3_QCOM_PD_BUS,
+	DWC3_QCOM_NUM_PD,
+};
+
+static const char * const dwc3_qcom_pd_names[] = {
+	[DWC3_QCOM_PD_POWER]	= "power",
+	[DWC3_QCOM_PD_BUS]	= "bus",
 };
 
 static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
 	.power_lost_in_suspend	= true,
+	.fw_managed		= true,
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -169,6 +187,164 @@ static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
 	return ret;
 }
 
+/*
+ * Firmware-managed resources
+ *
+ * Firmware owns the clocks, interconnects and GDSC and exposes them as two
+ * power domains:
+ * - DWC3_QCOM_PD_POWER ("power"): the GDSC supplying the controller
+ * - DWC3_QCOM_PD_BUS ("bus"): clocks and interconnects, which also need
+ *   "power" to be on for register accesses to succeed
+ *
+ * The domains are voted directly from the PM callbacks. The driver does not
+ * mirror the aggregate state, as the real state lives in firmware.
+ */
+
+/**
+ * dwc3_qcom_domain_attach() - Attach power domains
+ * @qcom: Pointer to the dwc3_qcom structure
+ *
+ * Attaches power domains for firmware managed resource handling. The
+ * domains are detached automatically when the driver is unbound.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		/* Runtime and system suspend need different supplier states */
+		.pd_flags	= PD_FLAG_NO_DEV_LINK,
+		.pd_names	= dwc3_qcom_pd_names,
+		.num_pd_names	= DWC3_QCOM_NUM_PD,
+	};
+	struct device *dev = qcom->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
+	if (ret != pd_data.num_pd_names) {
+		dev_err(dev, "domain attach failed (%d)\n", ret);
+		return ret < 0 ? ret : -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_power_domain_put() - Vote the power domain off
+ * @qcom: Pointer to the dwc3_qcom structure
+ *
+ * pm_runtime_put_sync() drops the usage count even on error, so only warn.
+ * Failing the caller would make it think the vote is still held and
+ * unbalance the next get/put pair.
+ */
+static void dwc3_qcom_power_domain_put(struct dwc3_qcom *qcom)
+{
+	int ret;
+
+	ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[DWC3_QCOM_PD_POWER]);
+	if (ret < 0)
+		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
+}
+
+/**
+ * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: If true, leave the power domain untouched and only vote bus
+ *
+ * Each call must be paired with dwc3_qcom_domains_put() using the same
+ * @bus_only. Runtime PM usage counting keeps a domain on for as long as it
+ * is needed, regardless of the state firmware left it in.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
+{
+	struct device *power_dev = qcom->pd_list->pd_devs[DWC3_QCOM_PD_POWER];
+	struct device *bus_dev = qcom->pd_list->pd_devs[DWC3_QCOM_PD_BUS];
+	int ret;
+
+	if (!bus_only) {
+		ret = pm_runtime_resume_and_get(power_dev);
+		if (ret) {
+			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = pm_runtime_resume_and_get(bus_dev);
+	if (ret) {
+		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
+		if (!bus_only)
+			pm_runtime_put_sync(power_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: If true, leave the power domain untouched and only vote bus
+ *
+ * Bus is released before power, as bus accesses need power to be on.
+ */
+static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
+{
+	int ret;
+
+	ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[DWC3_QCOM_PD_BUS]);
+	if (ret < 0)
+		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
+
+	if (!bus_only)
+		dwc3_qcom_power_domain_put(qcom);
+}
+
+/**
+ * dwc3_qcom_resources_enable() - Enable clocks and interconnect, or vote domains on
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: Firmware-managed only: leave the power domain untouched
+ *
+ * Returns 0 on success, negative error code on failure.
+ */
+static int dwc3_qcom_resources_enable(struct dwc3_qcom *qcom, bool bus_only)
+{
+	int ret;
+
+	if (qcom->fw_managed)
+		return dwc3_qcom_domains_get(qcom, bus_only);
+
+	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
+	if (ret < 0)
+		return ret;
+
+	ret = dwc3_qcom_interconnect_enable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+
+	return 0;
+}
+
+/**
+ * dwc3_qcom_resources_disable() - Undo dwc3_qcom_resources_enable()
+ * @qcom: Pointer to the dwc3_qcom structure
+ * @bus_only: Firmware-managed only: leave the power domain untouched
+ */
+static void dwc3_qcom_resources_disable(struct dwc3_qcom *qcom, bool bus_only)
+{
+	int ret;
+
+	if (qcom->fw_managed) {
+		dwc3_qcom_domains_put(qcom, bus_only);
+		return;
+	}
+
+	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+
+	ret = dwc3_qcom_interconnect_disable(qcom);
+	if (ret)
+		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+}
+
 /**
  * dwc3_qcom_interconnect_init() - Get interconnect path handles
  * and set bandwidth.
@@ -181,10 +357,16 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 	struct device *dev = qcom->dev;
 	int ret;
 
+	/* Interconnects are managed by firmware */
+	if (qcom->fw_managed)
+		return 0;
+
 	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
 	if (IS_ERR(qcom->icc_path_ddr)) {
-		return dev_err_probe(dev, PTR_ERR(qcom->icc_path_ddr),
-				     "failed to get usb-ddr path\n");
+		ret = dev_err_probe(dev, PTR_ERR(qcom->icc_path_ddr),
+				    "failed to get usb-ddr path\n");
+		qcom->icc_path_ddr = NULL;
+		return ret;
 	}
 
 	qcom->icc_path_apps = of_icc_get(dev, "apps-usb");
@@ -219,6 +401,9 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 	icc_put(qcom->icc_path_apps);
 put_path_ddr:
 	icc_put(qcom->icc_path_ddr);
+	/* Leave no stale handles for the error unwind to disable */
+	qcom->icc_path_ddr = NULL;
+	qcom->icc_path_apps = NULL;
 	return ret;
 }
 
@@ -369,7 +554,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
 	u32 val;
-	int i, ret;
+	int i;
 
 	if (qcom->is_suspended) {
 		/*
@@ -379,6 +564,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 		 */
 		if (dwc3_qcom_is_host(qcom) && !wakeup)
 			dwc3_qcom_disable_interrupts(qcom);
+
+		/*
+		 * Runtime suspend dropped only the bus domain. System suspend
+		 * must drop the power domain too, so that system resume, which
+		 * votes both domains back on, stays balanced.
+		 */
+		if (qcom->fw_managed && !PMSG_IS_AUTO(msg))
+			dwc3_qcom_power_domain_put(qcom);
+
 		return 0;
 	}
 
@@ -387,11 +581,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
 			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
 	}
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
-	ret = dwc3_qcom_interconnect_disable(qcom);
-	if (ret)
-		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
+	/* Runtime suspend keeps power voted on; system suspend drops both. */
+	dwc3_qcom_resources_disable(qcom, PMSG_IS_AUTO(msg));
 
 	/*
 	 * The role is stable during suspend as role switching is done from a
@@ -442,13 +634,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
-		return ret;
-
-	ret = dwc3_qcom_interconnect_enable(qcom);
+	/* Runtime resume re-votes bus only; system resume votes both. */
+	ret = dwc3_qcom_resources_enable(qcom, PMSG_IS_AUTO(msg));
 	if (ret)
-		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
+		return ret;
 
 	/* Clear existing events from PHY related to L2 in/out */
 	for (i = 0; i < qcom->num_ports; i++) {
@@ -696,8 +885,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	qcom->dev = &pdev->dev;
 
 	priv_data = of_device_get_match_data(dev);
-	if (priv_data)
+	if (priv_data) {
 		qcom->power_lost_in_suspend = priv_data->power_lost_in_suspend;
+		qcom->fw_managed = priv_data->fw_managed;
+	}
 
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
@@ -705,10 +896,16 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 				     "failed to get resets\n");
 	}
 
-	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to get clocks\n");
-	qcom->num_clocks = ret;
+	if (!qcom->fw_managed) {
+		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to get clocks\n");
+		qcom->num_clocks = ret;
+	} else {
+		ret = dwc3_qcom_domain_attach(qcom);
+		if (ret)
+			return ret;
+	}
 
 	ret = reset_control_assert(qcom->resets);
 	if (ret) {
@@ -724,9 +921,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
-	if (ret < 0)
+	/* Takes the votes whatever state firmware or the bootloader left */
+	ret = dwc3_qcom_resources_enable(qcom, false);
+	if (ret) {
+		reset_control_assert(qcom->resets);
 		return ret;
+	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -805,7 +1005,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	reset_control_assert(qcom->resets);
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	dwc3_qcom_resources_disable(qcom, false);
 
 	return ret;
 }
@@ -820,7 +1020,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
 	dwc3_core_remove(&qcom->dwc);
 	reset_control_assert(qcom->resets);
-	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
+	dwc3_qcom_resources_disable(qcom, false);
 	dwc3_qcom_interconnect_exit(qcom);
 
 	pm_runtime_put_noidle(qcom->dev);
-- 
2.34.1

