Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763E1D432D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362702; cv=none; b=dtWtpZUpXQSrza0B0XDQBTYUe3e89/PAxj4+E8hf23dl8OoPdFUZ1UOBUHwlxWZhsy2nY00Ir32+4JApG62g+4VtxbLjk32mnoQnY9Ut1LvaDFb9+RgWGZt9CNTwhEcWHwiSWSctlSwmpNch3QtRlqU7jdFvlSrDBosdxU9uE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362702; c=relaxed/simple;
	bh=7KDqgod1GH8fjPIehGEiGnloM7RkFPHvH2WRwwPGAsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nhOEF1ddOnmAOEMtGvyBkAbKXLSxU2/hXBUzJIWIZ/9jO0gGcOLQ58Ml+D9FfeP+S9ABVqHaQsagTulbraOk3TJcd851Gne1ptwGDOX1MQFcjQAy8fdqf8V5Y+tvM0boTE6rb3NGCLofP4tHpYrKikwPDSkHzlTrg/As4qJy4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoqdohNx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMVJewjG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoqdohNx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMVJewjG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmYR3686135
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ppfdFba9NOF
	0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=; b=UoqdohNxKpwMCxxz8E4VqEH0tU+
	J6jxU/ZmnCo5uNc0Lg8L3IeklXORD5N7Up+TtUjz1B/qaaGgIICz8rZ32OUQAG2n
	LlrO69yKPhTG0WPsxTJbRJDgrahH8QBpFbR0Mk4VjByHdRpc3qKrNqOATaj5oC1A
	k0Isy3JFj2IsCY47fLUw0D9dfebW6NupYlCuEhwpAAjw3ZLdwAzPKlV0gMIvAHKV
	5NDt1WUwWorEcTXVciZLvA4W8jXSbbJVuF/sdEycKE9sjfLyxqP2har/XNxBHI6I
	SD4dg6XUgNuU9KT/qlWLcUjJk6kzWF/7QQTgwqDZWFDyg65zpp/3x6MKZzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609a68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:44:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so4855072a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791362699; x=1791967499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppfdFba9NOF0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=;
        b=IMVJewjGilxgjDFIp5qqcLFkSOMKtrtidqFrTxmSKw+djDs4hp44DHBNzNn2JtFvFB
         3dvzB7jiYkDyiKsUMZHHrSV0NRXEXIvqhVnpN6wFQ7JCjRnTR00FLJCM/3FBe4WgJVbO
         Dg+auDevRcqsoMkuZ86iIa8lTTmkqy8m6LIN8yB/G4/9vKrD4vyB04+6p0RyWswX8KWn
         iMq/oC+TnrGC7ZvKRKGsn6KDAwAWraUSD77J/87RnJH2IH1No/7cyoWjC091g60sDV8U
         1hD++hG8PEA6mCM3mXnbxumzSctvToXRf8eYyzuLkEo0kVP4MKHwTKR5nsB51KFroaDc
         BxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362699; x=1791967499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppfdFba9NOF0mFMXk2YDZQ9fH8GXGF50XvGHTUha684=;
        b=HuCx10NYoLyKJUCUL6H8iFninhFq3YnVW5MfIb5QYG7gBRJbHC7pt9F2K1RcsYTGkp
         fNPgyHTunlKZ9+XkSCZR5jt0G30xSkOinYkULCjXRaL1tpS18/CLiQ/IrzGNl5nxH2E3
         4pao+ZmfXDPVWgYXR0N8hw0D+uV8H2p+qAmmFGferYNSt0EoHbLU72Gdf9SwabNtLnTE
         oFYwNhLxDKrtby1zWKskRAV9fbzUCKD6nZnQaLABwJnow/tx0le5KjMM7Adh1XbOoSSo
         VBvmu4l94nc5eRniZefmUkNow7Z6Lae/koC4KNRYS3XAyHde2AqHhdW3Ol3kXRVRB4gc
         Eyuw==
X-Forwarded-Encrypted: i=1; AKwUvBzcROSjBDLH1nvhumFIGuB8wtM/I3TTqK05lS1uE9LClqPV54mC8R0woGNo0t5ZYPSlYpl7Bw/efkkR2jJ/@vger.kernel.org
X-Gm-Message-State: AFuF++nyj5ngAKRuYwFwbMkni25z12laBnIqeZDg2b00nsq0xCShOd4Z
	celJSvLcxTdupWmjQVCebxKYUGwX/I96T26HnABe2768mRu77Z+wg+vvncm+8g44C0HTXITADk9
	A0tQRRnBXZFgRcm7wD0HqKiiM3P9I4WpBoEF/QVzs80MKI2eaffAb7/jDiYsFQ/+NgFZ6
X-Gm-Gg: AYBFou19lAqWErO6Zb/OeU0rLKizFhhS64WN/JwLvkT7kHkhbcDEBFRhqwUF/oOx842
	5cvDbMMIyiVAejEIF78bvnWsTKZkz92CjbYjkgxlfCAZNBedk9k37rrdqvYWaZ03Mlz/GkRxngj
	yEaYD5aaBgWCCKlF66nj486gDIwaUOgEE2Wf/AZqoaO/hAsBNFfvBc0ZKePKLn+lkZ+ffF9oc+h
	hmVl8Nvfn/uCiIBnJFF8HPKXATMJ5bgCB/78IQS49z06laJVNnx/yqUeMj+sa8RFNeN1bNvrWEo
	jpBTV0ht5TCs5Qy1c0Ov35CNp5Itaj4dr27JkHFGibDx+QVpHNnpKZ+/fntXZNm9OMNvXazNBHL
	dG5+fvNmAbCdLKyo92oXO0T/vOaKALlX50Gx6cj18VBdkjXqFG4/tZu7T5gAZ0XyWZfn3y/g=
X-Received: by 2002:a05:6a20:7343:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3e133dac803mr1178976637.8.1791362698861;
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3dd:57bf:7242 with SMTP id adf61e73a8af0-3e133dac803mr1178958637.8.1791362698381;
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a8b0616esm1075091a12.6.2026.10.07.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:44:58 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 1/3] misc: fastrpc: initialise channel refcount before exposing the misc device
Date: Wed,  7 Oct 2026 16:44:45 +0800
Message-Id: <20261007084447.922-2-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FjvpzVKrtg5pdgrE-rpT-L9mELohG0Dq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfXzWeig9mpU2NN
 T00GOKCv5HoQa+Ac6ZZJBjk9JNX+GuJ9gxldxX29jjFtPJX6avRkLHieEldWz95RVkPq8C5UGpn
 ++uAcypUN8gkwGLObsQXFOZyXik7iXM=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac6068b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zKkcRt30B2kSqeCsNmQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: FjvpzVKrtg5pdgrE-rpT-L9mELohG0Dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNCBTYWx0ZWRfXw+puPRaCHh3D
 pX9DkejvuBj5eFCBzcb/0hK6Xc2yyNy7H3pqLtU1oVeOzPKz+UY5+kOj7qtbAiWxJtGgVhbXuZI
 WbLoSBCRMyGjSbUwHcx88wW1ZqyES1pMOKqJxcEyJVo0VS/P/yUpx9r6v9kFg2SXBzMmiJsShsx
 1+1eeex0fRxMiQ2REyWWLNC2H2gYxGh+SJYnKdrxP8nveue15Ftpf98Gx1mPtEAoW2Lks+JmF2m
 8UWS02l+8Zi1Vn7i3LjBNZBEOwT46ZnXQdimDEtq+qbsz9jIQelcnQabYaECHJBVpngeSijTw6h
 JO/G4Cyu/37dGK0vwc4DUJxH68CpIOn7Yr0dJPVHJ3ms4frzmFIoXf2vPqiGd1bNvZUrve+eEm9
 wBc4mIxzBOPdIvAB6VqKCUvZjkj3FfmO8cA4vtV7D6sO6Z5xQg2sjF24JIOdFHpQodzIHnNTKL6
 vtIjwloamKG4P4NgwOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070034

fastrpc_device_register() calls misc_register(), which immediately makes
/dev/fastrpc-<domain> visible to userspace. However, kref_init() on the
channel context refcount only runs after the whole domain switch()
completes, several statements later.

Any process that opens the device in that window reaches
fastrpc_device_open() -> fastrpc_channel_ctx_get() -> kref_get() on a
refcount that has never been initialised and is still zero, which
refcount_t correctly reports as a use-after-free:

  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 0 PID: 760 at lib/refcount.c:25 refcount_warn_saturate+0x120/0x144
  CPU: 0 UID: 0 PID: 760 Comm: adsprpcd
  Call trace:
    refcount_warn_saturate
    fastrpc_device_open [fastrpc]
    misc_open
    chrdev_open
    do_dentry_open
    vfs_open
    path_openat
    do_filp_open
    do_sys_openat2
    __arm64_sys_openat

This is easy to hit after a subsystem restart, when the DSP daemon
reopens the device as soon as it observes the PD coming back up, racing
with fastrpc_rpmsg_probe() on the rebind path.

Move kref_init() ahead of the device registration so the refcount is
always valid by the time the node is reachable from userspace.

Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992ee..05b2e7e4ad3b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2599,6 +2599,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	data->poll_mode_supported = soc_data->poll_mode_supported ||
 		of_machine_get_match(fastrpc_poll_supported_machines);
 
+	kref_init(&data->refcount);
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
@@ -2626,7 +2627,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		goto err_free_data;
 	}
 
-	kref_init(&data->refcount);
 	atomic_set(&data->ctx_seq, 0);
 
 	rdev->dma_mask = &data->dma_mask;
-- 
2.43.0

