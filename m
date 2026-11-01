Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571747;
	b=lSYF6CDJQtN+h1qvmeEL7l/8L0hFiYKfG/ZXiE2QxnWLzii56J51UP0qLq1GlZq6bZL/
	 aN8O9rtFgNu6ZiNgz3q8q4sk0UwebV7kaxhFLgtylkdKsd6wl+iNdRtCr/+UlFusHO+1o
	 lj91lUz9zlqPp9CF9CEfe3k4XHYyj8sNRkw1xvB2zOnSKOwar1mvE17QqkDGEL+XuTiTY
	 nfR/MtmcaTqPRwLluoyTa7yjfhtj80K7IzGIqhHVrcoQDmjYBQ/yFmpEHOEGAxDiP201B
	 ID1+DQg0sch5Nn3rWaYuCLVN3Y/+bzypc0uH6ldk/lij4nS7DrKL8vdd2DL0E1NkmQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jpC/IYqlEQIVEU6VUo3DLK+z4bU8wLdRauEXeVFTtZk=;
	b=EQMCkaKU2u0GSgKvv/ywWdHSZCMS5h3pAaGgtlEVYabsAqR8tC88WchnPxgs9CBiuWGO
	 NADJgRcn32UF6jS+gsg95QwRE+bQHDyApqOILpgVot1AHSI0R+2JsQ0wJFvOKqfCevGk5
	 ve1bGhaDV6BrgWb1HSmAjtn8kZi1m1jKXk/+KHRdw25lmvOLwlvfUcGoK5GkSWHieX/wc
	 EhskxZd3hOVPK0SkE8xPj8+pRN5ivR77JjmSN2lyqUGKLxKpBQj/9yWqJmF2f1UlvNkEJ
	 YJ8tG4S1BW101Rrxf/w3/g2phHLeKnmYCQ1N5Qt4wIFpL9gbRP3SI9sHcwSb2FSfoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUdj004o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuCfQU02;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F20606ECE7
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 22:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F20606ECE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUdj004o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuCfQU02
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3II2377053
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 22:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpC/IYqlEQIVEU6VUo3DLK+z4bU8wLdRauEXeVFTtZk=; b=JUdj004ofQSpv/lc
	p4kMNW23ZOBcmj1c+iyNBR6pVE5gsNK4/R3Qimsqn4Fta3uc661bROTDev4UMclU
	KKOnhRF2ccirsg8XbClfhVpo28DIrtsf8x9DDPwEB1wWbSUSys2LmduTVBry6Kus
	L0hihUVYeFvvYusOOgCtTuxGD+LIsyFc5LLxkjdgrBCYAmyFjy9G6o7mC2c4jANT
	E2aEmYQY8BiusgEHf2AMICO/lJergTyqZ4TiFERw9svMr81ZWHXu/WGJk+0mr8a9
	qwqUAGKO6c54XrNjtOPAJrVPUqThD2FcTfCuH8JWZzNKRb0AALIRYjLVj/P/lwA8
	z0bTZg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6me2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:22:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so5121224c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 14:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571745; x=1794176545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpC/IYqlEQIVEU6VUo3DLK+z4bU8wLdRauEXeVFTtZk=;
        b=AuCfQU02qjU0wo8IVlEXeq8Ts8LcWGBEaLRe0E1Q3KmwhqPZrTtHfYPABGHiAAkIa3
         uqfUjisTK1BsMudEBOOGa0cjOTR0kRIHLC3mxQ26+O58Ad5wTIPpvP36xpjnlhVYcY/v
         huTXsdVc0B7DHOdycFiG2dzTxI9ErRN5vuEvDPvUKX8PMcF2Wm6CPNgV8g4BXYVxeJrb
         XeNxkqlEIM//U+XJdZbUfjlwTkxuQLjtoNwvst+Hj2RQpDOTwipkEs4c8w/msXZs2ijV
         dWBua2Smwg3uDyazyZ2QMx2tlEQH3zEnO54iiuiwQ2DgxZgGwiYERIdESPUDOBZ5bAYc
         mnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571745; x=1794176545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpC/IYqlEQIVEU6VUo3DLK+z4bU8wLdRauEXeVFTtZk=;
        b=RnOdrsjtrcXY1n5y0CqhhiPGeWDLB4EV6sXtqeTJ3aL5BuJI8XHBUXB13i8cFRiBhg
         S3hIuBS6uT/7sFIP73DdGlHkZf2iyhxdjYMrLwldHzk5pUDUc/pxhZnhcvTRrKXfKSYG
         dGxkt3fVU/Fw7EKtpNeB757l1RGLbXiHcBba61/aCMFQiE45JnwgWQQdGET3dgSDIfQR
         YBmtSFF5nMMa97vLonvI4xzVH3Utkqkvwz2FfWeYoqn10/vaTbzTg0DsJyY0FBGceT61
         9UtJKU+vEcqvbHUEZTgfmNlBjTGkXyb87EzWu0fLwDK0ta8TrltbGUFX5ifyVQYVAaVc
         FDNA==
X-Forwarded-Encrypted: i=1; AKwUvBwDGRLgebv9ahwFem9DBlw4dszLzvv2HhWmHc5GIE/I6ypFYx5htqyrpKq9ZKdLa1NIX6hhrhodG9Ie6KeS@vger.kernel.org
X-Gm-Message-State: AFq9FYJtw24rHg80fzit1iVsLNTT8e6noNS8enMraEGqE7n8Xk5QYVxV
	jPKJ0hK97XXquCiOICXZoY+WklpiY0xLC5WIHXOw3y8BZQO3qNEDCXmvylMvaPeyTStYkZZz66k
	SNEeCBDp3DCYgOxRiLRT53n+RRD0PX7he4CsnKhKzMEO4LmtWyXnXdzrxLV+qnmsz1Fl/
X-Gm-Gg: AYBFou0vYXiRZLOuvuDoXc7nFZLRMzOAQTIqOPXWxcu2uK85M3YvVhYgJTBVFg2tgdX
	KZeFypPqnQkv6oMKPoyWYe9lovdq0AvVUmnOEc6JXbrpmo6hQVKlOJnzs6nhhV5lvhdTTsSzHUO
	VN/dqf3Ii/laUFuQQgO0y/fKnlq6CP0g0724I2eNttBR7V/wyrEtxKdY3l9t9c0cwAnmwJmHEAj
	OKm5vkOKHfxwlPMKGPavUEJURdndfeBeBRl82QyHeoNhOcBSUSMzn+94focjlo2l3XH0nulkdEG
	GMiVhjvQh3N1z91mSymBPIFjI+wcvqCB7NkhFGZdRhkq6qUQP9RHbne3O/ECT/crtAxnmmRX3x0
	ImIHCH4sEpGPzO58nByoLpJy3DRVL8QJ9qLq93O7fDCVK4ca1wGQSrdMxnSBa/tMsR7Jn6FDd8X
	90fjFrfQ==
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr16809667c88.41.1793571744378;
        Sun, 01 Nov 2026 14:22:24 -0800 (PST)
X-Received: by 2002:a05:7022:e27:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1ac5e8e1e4bmr16809589c88.41.1793571743786;
        Sun, 01 Nov 2026 14:22:23 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:23 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:18 +0530
Subject: [PATCH v4 05/25] accel/qda: Add UAPI header and DSP query ioctl
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
Message-Id: <20261102-v4-v4-5-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=5862;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=FEMAhmI+29jlqJnKsKpFRXXV2+SDwS5N0khfFCto3EI=;
 b=CiORchHpsSEp682EW8iJpuxw2yAvzjmIGDci/Gq73YkHBlvgwyHOKFGV0OkjrhatzXjEGGkMP
 BFFyVOEixgXAvgZsUUTISTQcfbeJZPi4nnOJTcHfRscrXyEujVm2DxB
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: Ua3J5xMwtDYNmlXOxKLFKgBlOdiy64Wl
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7bba1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SLfWgZofmqkV2j7029kA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Ua3J5xMwtDYNmlXOxKLFKgBlOdiy64Wl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX0nri7RDzL9Te
 Fsht09Il1OgiikXRS4vj3XgViucLzqO4uMWGXVQ2UYswR2y6lvJV8saJNb5VPjyEapt15JtbcsK
 N8StfybI5OGpHEDpSmD04Q/S32Aph00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX5Jtjj7PNMAsp
 gCfcfe/GyOb4M5OKjHUvXekr1Y1rgVg+2h9QmhCpEOBISACmFE5+y/M5xVqv/uW/mPCAM8fYuY2
 g0NlTq2d4Pv+2uRuJFHZX+9rf9CuOJUekSQ4bdRWjpxoST8VdQ+0hKa2v8s4hMPIqOui4di+473
 Lidtm4MeCXByb00f+48U1UAiztAYQPvrVg6g14yEhryDEptHN3ok1E/IUOcUcwPBHzFMLoz0VPE
 5y/rd9lthuUOI/gB7qh+6l5YlzTbhux13XgEz5zjMo2+cnC2cL8A73mPc+kN6SOOZHoZHBk1KW4
 oiJX//HhEP8gSplQ5bXTeEiafjwgzQu49MXy6vBIfuBWduYVBmbuKMzaoCO2Lvny0ZpIKmFecl6
 KeiP8XfUs1n8OHzUY0jCa3iqQxz1WFF07KsOqDwZQbv2pYctQ59tISrvvOAlIPLWa5SMdqEZU+W
 A1AegheKiShocP5DuaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

A system has one accel node per DSP domain, and which node is which is
not something user space can tell from the node name: /dev/accel/accel0
may be the CDSP on one platform and the ADSP on another. An application
that wants a particular DSP has to open the nodes and ask.

Add DRM_IOCTL_QDA_QUERY, which returns the name of the DSP behind a
given node, taken from the "label" property of its device tree node.
The ioctl takes a query_type selector so that later additions (DSP
capabilities, attributes) do not each need an ioctl of their own, and
is DRM_IOWR rather than DRM_IOR so that the selector reaches the
kernel.

Unknown query types are rejected with -EINVAL rather than returning
zeroes, so that user space can tell an unsupported query on an old
kernel apart from a query that legitimately returned nothing.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS                   |  1 +
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_drv.c   |  8 ++++++++
 drivers/accel/qda/qda_ioctl.c | 30 ++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h | 13 +++++++++++++
 include/uapi/drm/qda_accel.h  | 41 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 94 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77687a35ac13..1316e63c1151 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22982,6 +22982,7 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/qda/
 F:	drivers/accel/qda/
+F:	include/uapi/drm/qda_accel.h
 
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 1ca991e198ed..402e7dbebbf0 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_ioctl.o \
 	qda_memory_manager.o \
 	qda_rpmsg.o \
 	qda_soc.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index a99e23933f6b..e722135238f3 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -8,8 +8,10 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
+#include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_ioctl.h"
 
 static struct qda_session *qda_session_alloc(struct qda_dev *qdev)
 {
@@ -54,11 +56,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
+static const struct drm_ioctl_desc qda_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+};
+
 static const struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops = &qda_accel_fops,
 	.open = qda_open,
 	.postclose = qda_postclose,
+	.ioctls = qda_ioctls,
+	.num_ioctls = ARRAY_SIZE(qda_ioctls),
 	.name = QDA_DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
new file mode 100644
index 000000000000..380c2526d9d2
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/string.h>
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/qda_accel.h>
+#include "qda_drv.h"
+#include "qda_ioctl.h"
+
+/**
+ * qda_ioctl_query() - Query a property of the DSP
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_query)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(dev);
+	struct drm_qda_query *args = data;
+
+	switch (args->query_type) {
+	case QDA_QUERY_DSP_NAME:
+		strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
new file mode 100644
index 000000000000..b8fd536a111f
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_IOCTL_H__
+#define __QDA_IOCTL_H__
+
+#include "qda_drv.h"
+
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+#endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
new file mode 100644
index 000000000000..b9dc4787bd42
--- /dev/null
+++ b/include/uapi/drm/qda_accel.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_ACCEL_H__
+#define __QDA_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_QDA_QUERY		0x00
+
+#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
+					 struct drm_qda_query)
+
+/* Query type definitions for drm_qda_query */
+#define QDA_QUERY_DSP_NAME		1
+
+/**
+ * struct drm_qda_query - Device information query structure
+ * @query_type: Type of query (input)
+ * @dsp_name: Null-terminated name of the DSP (returned when query_type is
+ *            QDA_QUERY_DSP_NAME)
+ *
+ * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
+ * based on @query_type.
+ */
+struct drm_qda_query {
+	__u32 query_type;
+	__u8 dsp_name[16];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __QDA_ACCEL_H__ */

-- 
2.34.1

