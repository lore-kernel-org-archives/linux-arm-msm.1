Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571919;
	b=GnxgHvRBpVGstyBw+oWhpfRpipRkwteptLn07K3krySv30zyR/k0Nzzj0sgyRPsfjUf8
	 1udciaZq6mw6fLsu830hPzJHEdzOJJdjOYnxFDbz+Hj+uW7Rv4/dOgdA1Gmip0Z/Kul9H
	 or2PLrfrvs9EqTv7WZXiaLF82wiSgd6/o0m5jZhJD653KaBIfA25+vgCEJSdVLsEgE7F7
	 F6Ie8N7OtgnExfR1w525W1P91YxvsjhU1HliJfY5+7NTBuIQ69+YBooV123Jj71z3N+NH
	 UfEv0em4jwyz8CEE5369gH5gqZLiEiAx28JzXTzmB8iND+qrT9MTdW8banssFMyp7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mq4v21tGOqTatBGXDzvOKSgKE9+F60z+3Zn0OTugLJk=;
	b=ii0hCtau8gV1v6tyLOlU/6ctTOOjU3jKUfLJAKLRxbrVcOAAwU0R40151srAivkG57/6
	 xG8PjH/UpCBWJAt61wrkCrYHvjIGPqhM1nGG/wczllNX4vTYX/VMlIZf1CtU/U0Locx9+
	 yBWQBCDwRT3YFiwFqNihSrrJxV+ZPdEXI1KnZDuulUa9DdpuSvH6bY0mAN7KnK41aDzRQ
	 ibckcMMSAgDPiuo46P5M22R6fDTYWMl5a5qg0HA9WhEHHkSF5VzANMQhQTLCL0w4ii0hX
	 EsSlQHOk6UHLTumVYof7oE50+7+MiL0s0SqJip+qP9PTmKhOhCaYr55oe2An6VRkm/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="A/dbVlrd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdwbfjfA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3F606ECD2
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D3F606ECD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A/dbVlrd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdwbfjfA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK29i834849
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mq4v21tGOqTatBGXDzvOKSgKE9+F60z+3Zn0OTugLJk=; b=A/dbVlrdba2bDQDM
	fPBcuSk56UNJcQcm91riAMq0oxpXIGCmFNMFffRFdnw4TQ5067gwH4+2ai3A+Sgv
	HGIJs3LgQZzbaEeq0n4U6HhWMyA5LYAz1WHOm/FA9mUf+lrpLjO7gR6QM4FaoWZJ
	aXUwxF01SgSqOx+V5dRPYQoVAZtiTY0PglN8VmI02x18IEbgw7K+KBQEmzzUPLkg
	TYVa0V2xDUkmI/ASxhDHU6iYOdbpWKbAyfD5IcoKiw/ksAQgN9ltBvQ579mhKR4Y
	PjtMoQeABI/jaRzYTcrGnD5zu7DRwnPhohTvrZ5KAJdPrJD1QBXywDyQFMHJEjss
	3Aa4aw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9c4wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:25:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so3662635c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571917; x=1794176717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq4v21tGOqTatBGXDzvOKSgKE9+F60z+3Zn0OTugLJk=;
        b=NdwbfjfA8CgRgON+wa0cAuEYySzE16LiBOJ6W1l0jkmw6lxjs1wmtTIiCXKR4Af+W+
         GPBtk8Die9H86zHsbWv7G6rrg+w5oonvJg2LtfyxfDsYGZ7qo4eE40eod3RN70y1905f
         NwfsQSW8KmHJIS/JlFZ00YOPcUHjCmBHymv1Avy6HOclIKz5aFJCtboAsOucDtMDibaW
         RMR3jwMUZRG9H7DmSIv8JRYj+5lwKMco3Sr+CjdF8iBSi1YzigoGBtzHuVHGUXEpl+rs
         kWiSSy12dtFiH1wWmtQWrT50bu1Sfa+WS3Cd5C6VPiNGlsl/TIbtc7MhgRaHgV8Jt2e7
         7Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571917; x=1794176717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq4v21tGOqTatBGXDzvOKSgKE9+F60z+3Zn0OTugLJk=;
        b=VvZvKfyad245IHQXhSPxK73AuF9Uj9GVTzjaBCOVrj2yxPbxeiwQ/EA9jnQklNuR0X
         NDR+CGS05JlWvCJdkjE3hHkq53+wOavw2G+ukViYqIQz5jQJenDQi3PXXdIUyewLfSeU
         2nh7IWeglwSINbguAtXyLv8ozd7YGhN1DdtpjA88PsGn+OyAfPG2Nv2qgMcJJ93bJjyy
         S6HaNQlWFyfveE9ALzxhfbocL9UiS+qA6WTWR8y8Lekh/iFKbUHTP5MnMyMgPBtMETPA
         e4z05cf4Avc034MKUomyws+Eb6QN5vLx/sLeaAFYKhD1E3Jm5sNujPisqzxmS8PfrsvT
         vhLw==
X-Forwarded-Encrypted: i=1; AKwUvBxV18M7gPSn5LLfQAISFBQdgOdKR9aaVGa6I5fwZ1EIToSNwIuYqKtAWKfinbf2ajuwMK9saa+M2nHkuGbx@vger.kernel.org
X-Gm-Message-State: AFq9FYIjYCs/QAZzXR4AtQGIVIN+uNCp0BJuACwxsbV5UVmiEtS+rh7n
	MKfXdF92sOrnS3wfhteg8bX25EynIjB193kLHBI0KEu/G/0jkJIcpkfxWEqYunFD/6X4ztqlxox
	2MIj07PPi8VDmluWI7064s4wratibEudF7+8cy7PaGRwoUZ0tggk/DwAkhziBnIqTXr09
X-Gm-Gg: AYBFou3fCu/8DLUCb/iehDdYq5Im7cwTINHeudcN6hU1EW5zZjVB9bYEkmIoR4jXEwe
	QA2gj44ZHLbB/CrWfkBjZLSIF694Jee1JS/X4YZfB81c/drD1fownbA+35fcpUPE2OlhSXF2pg9
	38SvLn63r3VuUycRLVRz4jtL93VvKBOssqmFPoQc3q1hiPkh24K8WulhVGM4Y3MTuef4udh/VCU
	ZHrGAokJVy7TVadJdPxAbi7STgJnXcQ+bDFEE590cUQk9IQlEsRJNBLBXZYWC1g7tjos4fzxRri
	KJI/gPbXYloyg5tCZgOZ/Yl734CkaapkVQXb5YDLkhg7gU2/ZSrt1cx7QuUYbA+ax3t0473XEpu
	Od8oixXfPjB4VRNrLD3eXQgLR527a5LzAjO1DCrdbv4g7euhmFadKAjWFJ+YC8ISpEROlGgdnMB
	/8jIiwVw==
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr15877884c88.27.1793571916208;
        Sun, 01 Nov 2026 14:25:16 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr15877830c88.27.1793571915511;
        Sun, 01 Nov 2026 14:25:15 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:15 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:34 +0530
Subject: [PATCH v4 21/25] accel/qda: Add Audio protection domain attach and
 its remote heap
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
Message-Id: <20261102-v4-v4-21-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=16701;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=LgcntdqkBShlO8amls1wIzgARYknBeDNMKLW6fhJTQM=;
 b=bMiFsApKvZAseEa0qgwtOILtZWuZ2LEL69qPJWchDYEmxOve4YWXK4oae6srq+j0LLUzs4qXQ
 D3byeISDbCRCnOKD3jhP6D+rlWTGER4QGdY8Ydd4OtE1xRbYYSb0sO4
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: siJbDkeDKX_rnxh0qYa854tQ1Vlvvn-l
X-Proofpoint-GUID: siJbDkeDKX_rnxh0qYa854tQ1Vlvvn-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX8whvdBy6oaQw
 zNtHhpZt0L+HhE5YphWreXgq/q78HzBgTEhMsncis3z8ysFCNr6MTfpcTzwqY8nyItW+ECSV7Ng
 DTX8txjLNCPtrjFAX1oE2MQsw6gtoHCj+IGNoMQiB8MpUKjM11TWy1PIkICy96QGkiL4pKqhN1s
 OsqMDN6kdzUwlZm2x401owEcbSb5kMr8mBeokJeR9V6RLoOlsxR3jTJ1PYXc2bYrnngNdWlt11q
 J6J3dxh91cQa1PlgvwFPqyXjYtGXSMTizXThhTltqXYO/p6tHuhROWZzv2SSngWoPN1Km8XGBXO
 Q6BWQ2/0xwqnwpVNAnkWo/Q9HWTIs4RgI2c/mvxyEHUnusCxGnTzaIgo93MGgMwHXfLpu/CvU+s
 z5Of5g4BGtnzq4zzNPuHKYN1UbgaHXNg1YCryeU9qajUz5L9PW+bP0f0FS/M0Y9dOxNkLyWGpv6
 5wREcmySlD559o0y8RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX+duRg/htXHEV
 +odL5DmJ+zrHWOvVXOFpLcctFsSxBiWD/gS3wrCs1DhHxfokYnY5b1xW1ARtYCR9FygeLhPzUmW
 SzYfIdjT8evEhzrlMZ1Cl6adqGqRdEM=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae7bc4d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wuXFcW2BkFgktBl-NxIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Attaching to the Audio PD differs from Root and Sensors PD attach in two
ways: it names a static PD by a string rather than a fixed protection
domain value, and the DSP expects a region of memory reserved for it in
the device tree to be handed over the first time any session attaches
to it.

Parse the "qcom,vmids" property into a VM permission table and the
reserved-memory region into a physical range at probe time, and use
qcom_scm_assign_mem() to grant the DSP's VMs access to that range. Only
the first successful attach on a device sends the region to the DSP;
later attaches, including after a daemon restart, reuse it. The region
is handed back to HLOS when the rpmsg channel goes away.

The region is optional; without it an Audio PD attach fails.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/Kconfig       |  1 +
 drivers/accel/qda/qda_drv.h     | 19 +++++++++
 drivers/accel/qda/qda_fastrpc.c | 54 ++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h | 30 ++++++++++++++
 drivers/accel/qda/qda_ioctl.c   | 72 ++++++++++++++++++++++++++------
 drivers/accel/qda/qda_rpmsg.c   | 92 ++++++++++++++++++++++++++++++++++++++++-
 include/uapi/drm/qda_accel.h    | 15 +++++--
 7 files changed, 267 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index c440191a54ff..72b5ee6d58ec 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -9,6 +9,7 @@ config DRM_ACCEL_QDA
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
 	select AUXILIARY_BUS
+	select QCOM_SCM
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2f98fd83fdda..1d083ea9fdd7 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -9,6 +9,7 @@
 #include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -31,6 +32,9 @@
  */
 #define QDA_LEGACY_AUXDEV_NAME "fastrpc"
 
+/* Upper bound on the "qcom,vmids" DT property */
+#define QDA_MAX_VMIDS	16
+
 /**
  * struct qda_session - One user of a DSP
  *
@@ -118,6 +122,21 @@ struct qda_dev {
 	 * to, or NULL if it could not be created
 	 */
 	struct auxiliary_device *legacy_auxdev;
+	/** @vmperms: VMs the remote heap is shared with, from qcom,vmids */
+	struct qcom_scm_vmperm vmperms[QDA_MAX_VMIDS];
+	/** @vmcount: Number of valid entries in @vmperms */
+	int vmcount;
+	/** @remote_heap_addr: Physical base of the reserved region, or 0 */
+	phys_addr_t remote_heap_addr;
+	/** @remote_heap_size: Size of the reserved region, or 0 */
+	u64 remote_heap_size;
+	/**
+	 * @remote_heap_lock: Held across an Audio PD attach, so the heap is
+	 * handed to the DSP by exactly one of them. Protects @audio_init_mem.
+	 */
+	struct mutex remote_heap_lock;
+	/** @audio_init_mem: True once the DSP has been given the remote heap */
+	bool audio_init_mem;
 };
 
 /**
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 5bf55b7953c8..e9688e3ba404 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -930,6 +930,56 @@ static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *c
 	return err;
 }
 
+/*
+ * INIT_CREATE_STATIC packed layout:
+ *   [0] inbuf	sizeof(qda_fastrpc_create_static_inbuf)	IN
+ *   [1] name	namelen, including the NUL		IN
+ *   [2] heap	sizeof(qda_phy_page)			IN
+ *
+ * The heap descriptor is always present; its size is zero, and so pageslen,
+ * when the DSP already has the remote heap.
+ */
+static int qda_fastrpc_prepare_args_create_static(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct qda_static_pd_args *sargs = argp;
+	struct qda_fastrpc_create_static_inbuf *inbuf;
+	struct qda_gem_obj *kernel_gem;
+	u8 *gv;
+	int err;
+
+	const size_t off_inbuf = 0;
+	const size_t off_name = off_inbuf + sizeof(*inbuf);
+	const size_t off_heap = ALIGN(off_name + sargs->namelen, sizeof(u64));
+	const size_t total_size = off_heap + sizeof(struct qda_phy_page);
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 3);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+	gv = kernel_gem->virt;
+
+	inbuf = (struct qda_fastrpc_create_static_inbuf *)(gv + off_inbuf);
+	inbuf->remote_session_id = ctx->session->remote_session_id;
+	inbuf->namelen = sargs->namelen;
+	inbuf->pageslen = sargs->heap.size ? 1 : 0;
+
+	memcpy(gv + off_name, sargs->name, sargs->namelen);
+	memcpy(gv + off_heap, &sargs->heap, sizeof(sargs->heap));
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, gv + off_inbuf, sizeof(*inbuf));
+	assign_kernel_gem_arg(ctx, 1, kernel_gem, gv + off_name, sargs->namelen);
+	assign_kernel_gem_arg(ctx, 2, kernel_gem, gv + off_heap, sizeof(struct qda_phy_page));
+	drm_gem_object_put(&kernel_gem->base);
+
+	return 0;
+}
+
 /*
  * Find the buffer a mapping request names and describe it to the DSP. The
  * buffer is held by the context until the request is done, so that closing its
@@ -1223,6 +1273,10 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 		ctx->pd = QDA_USER_PD;
 		err = qda_fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case QDA_FASTRPC_RMID_INIT_CREATE_STATIC:
+		ctx->pd = QDA_USER_PD;
+		err = qda_fastrpc_prepare_args_create_static(ctx, argp);
+		break;
 	case QDA_FASTRPC_RMID_INIT_MMAP:
 		err = qda_fastrpc_prepare_args_map(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 29e1c3946d60..de04cadcaeb0 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -50,6 +50,7 @@ struct qda_session;
 #define QDA_FASTRPC_RMID_INIT_MUNMAP		5
 #define QDA_FASTRPC_RMID_INIT_CREATE		6
 #define QDA_FASTRPC_RMID_INIT_CREATE_ATTR	7
+#define QDA_FASTRPC_RMID_INIT_CREATE_STATIC	8
 #define QDA_FASTRPC_RMID_INIT_MEM_MAP		10
 #define QDA_FASTRPC_RMID_INIT_MEM_UNMAP		11
 #define QDA_FASTRPC_RMID_INVOKE_DYNAMIC		0xFFFFFFFFU
@@ -65,6 +66,9 @@ struct qda_session;
 /* Largest ELF image a process may be created from */
 #define QDA_FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
 
+/* Longest static PD name, including the NUL */
+#define QDA_FASTRPC_INIT_NAMELEN_MAX	128
+
 /* Idle invoke header buffers a session keeps for reuse */
 #define QDA_MSG_BUF_POOL_MAX		8
 
@@ -155,6 +159,20 @@ struct qda_fastrpc_create_process_inbuf {
 	u32 siglen;
 };
 
+/**
+ * struct qda_fastrpc_create_static_inbuf - Input buffer for attaching to a static PD
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_create_static_inbuf {
+	/** @remote_session_id: Session the attach belongs to */
+	int remote_session_id;
+	/** @namelen: Length of the static PD name including the NUL */
+	u32 namelen;
+	/** @pageslen: Number of remote heap descriptors that follow the name (0 or 1) */
+	u32 pageslen;
+};
+
 /**
  * struct qda_fastrpc_map_req_msg - Request to map a whole buffer
  *
@@ -379,6 +397,18 @@ struct qda_mem_map_args {
 	struct drm_gem_object *obj;
 };
 
+/**
+ * struct qda_static_pd_args - Kernel-side arguments for attaching to a static PD
+ */
+struct qda_static_pd_args {
+	/** @name: Kernel copy of the NUL-terminated PD name */
+	const char *name;
+	/** @namelen: Length of @name including the NUL */
+	u32 namelen;
+	/** @heap: Remote heap to hand the DSP, or zero size if it already has it */
+	struct qda_phy_page heap;
+};
+
 struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
 void qda_fastrpc_context_free(struct kref *ref);
 void qda_fastrpc_cleanup_handlelist(struct qda_fastrpc_invoke_ctx *ctx);
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 9b8cccfea1e3..41234fc576a9 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -121,7 +121,8 @@ static int qda_fastrpc_invoke(u32 type, void *data, struct qda_session *session)
 	if (type == QDA_FASTRPC_RMID_INIT_CREATE) {
 		qda_session_set_init_mem(session, ctx->init_mem_gem_obj);
 		WRITE_ONCE(session->pd, QDA_USER_PD);
-	} else if (type == QDA_FASTRPC_RMID_INIT_ATTACH) {
+	} else if (type == QDA_FASTRPC_RMID_INIT_ATTACH ||
+		   type == QDA_FASTRPC_RMID_INIT_CREATE_STATIC) {
 		WRITE_ONCE(session->pd, ctx->pd);
 	}
 
@@ -176,6 +177,54 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
 	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_RELEASE, NULL, session);
 }
 
+/*
+ * The Audio PD keeps the remote heap across daemon restarts, so only the first
+ * attach on a device hands it to the DSP. The lock is held across the attach
+ * so that a concurrent one cannot skip the heap while the first is still in
+ * flight, and the flag is set only once the DSP has accepted it.
+ */
+static int qda_attach_audio_pd(struct qda_session *session, struct drm_qda_remote_attach *args)
+{
+	struct qda_dev *qdev = session->qda_dev;
+	struct qda_static_pd_args sargs = {};
+	char *name;
+	int err;
+
+	if (strcmp(qdev->dsp_name, "adsp") || !qdev->remote_heap_size)
+		return -ENODEV;
+
+	if (!args->namelen || args->namelen > QDA_FASTRPC_INIT_NAMELEN_MAX)
+		return -EINVAL;
+
+	name = memdup_user(u64_to_user_ptr(args->name), args->namelen);
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	if (name[args->namelen - 1]) {
+		err = -EINVAL;
+		goto out_free;
+	}
+
+	sargs.name = name;
+	sargs.namelen = args->namelen;
+
+	scoped_guard(mutex, &qdev->remote_heap_lock) {
+		if (!qdev->audio_init_mem) {
+			sargs.heap.addr = qdev->remote_heap_addr;
+			sargs.heap.size = qdev->remote_heap_size;
+		}
+
+		err = qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_CREATE_STATIC, &sargs, session);
+		if (!err && sargs.heap.size)
+			qdev->audio_init_mem = true;
+	}
+
+out_free:
+	kfree(name);
+
+	return err;
+}
+
 /**
  * qda_ioctl_attach() - Attach to a DSP-resident protection domain
  * @dev: DRM device structure
@@ -190,24 +239,23 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
 	struct qda_session *session = file_priv->driver_priv;
 	int pd;
 
-	if (args->pad)
-		return -EINVAL;
+	if (READ_ONCE(session->init_mem_gem_obj))
+		return -EBUSY;
 
 	switch (args->pd_type) {
 	case QDA_ATTACH_ROOT_PD:
-		pd = QDA_ROOT_PD;
-		break;
 	case QDA_ATTACH_SENSORS_PD:
-		pd = QDA_SENSORS_PD;
-		break;
+		if (args->name || args->namelen)
+			return -EINVAL;
+
+		pd = args->pd_type == QDA_ATTACH_ROOT_PD ? QDA_ROOT_PD : QDA_SENSORS_PD;
+
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_ATTACH, &pd, session);
+	case QDA_ATTACH_AUDIO_PD:
+		return qda_attach_audio_pd(session, args);
 	default:
 		return -EINVAL;
 	}
-
-	if (READ_ONCE(session->init_mem_gem_obj))
-		return -EBUSY;
-
-	return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_ATTACH, &pd, session);
 }
 
 /**
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 7e58df3eb2e1..b93e906b5793 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -4,7 +4,9 @@
 #include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/rpmsg.h>
+#include <linux/string.h>
 #include <linux/wait.h>
 #include <drm/drm_print.h>
 
@@ -145,6 +147,81 @@ static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 	return ret;
 }
 
+static int qda_init_vmperms(struct qda_dev *qdev)
+{
+	u32 vmids[QDA_MAX_VMIDS];
+	int vmcount, i;
+
+	vmcount = of_property_read_variable_u32_array(qdev->dev->of_node, "qcom,vmids",
+						      vmids, 0, QDA_MAX_VMIDS);
+	if (vmcount == -EINVAL || vmcount == -ENODATA)
+		return 0;
+	if (vmcount < 0)
+		return vmcount;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	for (i = 0; i < vmcount; i++) {
+		qdev->vmperms[i].vmid = vmids[i];
+		qdev->vmperms[i].perm = QCOM_SCM_PERM_RWX;
+	}
+	qdev->vmcount = vmcount;
+
+	return 0;
+}
+
+/*
+ * The region is optional: without it an Audio PD attach is refused. It is
+ * recorded only once it has been assigned, so teardown hands back exactly
+ * what was handed over.
+ */
+static int qda_init_remote_heap(struct qda_dev *qdev)
+{
+	u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
+	struct resource res;
+	int ret;
+
+	if (strcmp(qdev->dsp_name, "adsp") && strcmp(qdev->dsp_name, "sdsp"))
+		return 0;
+
+	if (of_reserved_mem_region_to_resource(qdev->dev->of_node, 0, &res))
+		return 0;
+
+	if (qdev->vmcount) {
+		ret = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+					  qdev->vmperms, qdev->vmcount);
+		if (ret)
+			return ret;
+	}
+
+	qdev->remote_heap_addr = res.start;
+	qdev->remote_heap_size = resource_size(&res);
+
+	return 0;
+}
+
+static void qda_deinit_remote_heap(struct qda_dev *qdev)
+{
+	struct qcom_scm_vmperm dst_perms = {
+		.vmid = QCOM_SCM_VMID_HLOS,
+		.perm = QCOM_SCM_PERM_RWX,
+	};
+	u64 src_perms = 0;
+	int ret, i;
+
+	if (!qdev->remote_heap_size || !qdev->vmcount)
+		return;
+
+	for (i = 0; i < qdev->vmcount; i++)
+		src_perms |= BIT(qdev->vmperms[i].vmid);
+
+	ret = qcom_scm_assign_mem(qdev->remote_heap_addr, qdev->remote_heap_size,
+				  &src_perms, &dst_perms, 1);
+	if (ret)
+		dev_err(qdev->dev, "Failed to assign remote heap back to HLOS: %d\n", ret);
+}
+
 static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
@@ -163,6 +240,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	qda_fastrpc_flush_pending(qdev);
 	qda_cb_unpopulate(qdev);
 	qda_deinit_device(qdev);
+	qda_deinit_remote_heap(qdev);
 }
 
 static int qda_count_cb_nodes(struct device_node *parent_node)
@@ -195,10 +273,20 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
-	ret = qda_init_device(qdev, qda_count_cb_nodes(rpdev->dev.of_node));
+	mutex_init(&qdev->remote_heap_lock);
+
+	ret = qda_init_vmperms(qdev);
+	if (ret)
+		return ret;
+
+	ret = qda_init_remote_heap(qdev);
 	if (ret)
 		return ret;
 
+	ret = qda_init_device(qdev, qda_count_cb_nodes(rpdev->dev.of_node));
+	if (ret)
+		goto err_deinit_remote_heap;
+
 	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
 	if (ret)
 		goto err_deinit;
@@ -213,6 +301,8 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 	qda_cb_unpopulate(qdev);
 err_deinit:
 	qda_deinit_device(qdev);
+err_deinit_remote_heap:
+	qda_deinit_remote_heap(qdev);
 	return ret;
 }
 
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 59ad5b8cc997..7c439058876e 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -210,22 +210,31 @@ struct drm_qda_mem_unmap {
 /* Protection domains for drm_qda_remote_attach.pd_type */
 #define QDA_ATTACH_ROOT_PD	1
 #define QDA_ATTACH_SENSORS_PD	2
+#define QDA_ATTACH_AUDIO_PD	3
 
 /**
  * struct drm_qda_remote_attach - Parameters for attaching to a DSP protection domain
- * @pd_type: QDA_ATTACH_ROOT_PD or QDA_ATTACH_SENSORS_PD
- * @pad: Must be zero
+ * @pd_type: QDA_ATTACH_ROOT_PD, QDA_ATTACH_SENSORS_PD or QDA_ATTACH_AUDIO_PD
+ * @namelen: Length of the name in bytes including the NUL terminator
+ *           (QDA_ATTACH_AUDIO_PD only, otherwise must be zero)
+ * @name: User pointer to the NUL-terminated name of the static PD to attach
+ *        to (QDA_ATTACH_AUDIO_PD only, otherwise must be zero)
  *
  * Binds this file to a protection domain that already exists on the DSP,
  * instead of creating one with DRM_IOCTL_QDA_REMOTE_SESSION_CREATE. Every
  * later request on the file is directed at it. Fails with EBUSY if a process
  * has already been created on the file.
  *
+ * For QDA_ATTACH_AUDIO_PD, the first successful attach on a device also
+ * hands the DSP the remote heap reserved for it in the device tree; later
+ * attaches reuse that heap.
+ *
  * Requires CAP_SYS_ADMIN.
  */
 struct drm_qda_remote_attach {
 	__u32 pd_type;
-	__u32 pad;
+	__u32 namelen;
+	__u64 name;
 };
 
 #if defined(__cplusplus)

-- 
2.34.1

