Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3383E075C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764647; cv=none; b=oiY3xiVEKwTDGO8IqbLTR85Ek0CSSV/gRYRR+1jNjJ1pKYy9x3jznvo6DRouHh/D82Oi/8BCxv+pH/BrYgVpqP3K0pcTNNHI5JLkfLZSClaB9lMVt9s42srG48dbQPwFmAeV3oVtr3JcjdHHU1zSc9xIVE2i2ZdmT+OjQJ9suJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764647; c=relaxed/simple;
	bh=xC60j0rVihRHXFrz0mpF9bpsFW3HzWxGQuUrVXji9To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G4i3N87U4PmfzEueetpzLaKRSfHaIuS9AtxgkWH3AseUqEPcNrn9YDbB1NLv4A0rOOHKCY90+eXo3mhEqY3r1jwWe7n4/jIrkTGpzVhSE9W1BVxureAz5sGHEuik13Eq4TWpSnGOgJpLc9N1toUVvHbxwT0eaYlJWVo789sy22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKqq5TlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSzIjRN5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKqq5TlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSzIjRN5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lBtC3454858
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggx
	uIRingaY=; b=AKqq5TlGrVvdiPCmnW0Mq/ufxC/rIn4VPMMFf5wUk6/8GaGrnbM
	C5XdCRbrqKfwkypt25M8lroj5IlzVFO6QEpOHup6DblsX4R5T2Byy2oqcMU+cGjp
	CEinPhgig+lqlFey4+UK9B2dgDN0A5Z7fj5g5D/NbuHHXp6lKmyn4AqwfFhVleNm
	lJDhWJvBpA9fxhWUjxQAVDO4MpN6Kjr8B2Sy5ZMyQZBnzzLGTbWl63Y0COuTOeRz
	028H0Xh4WQud3JcAxr1OC6q0QXM7YKH0EqTgHBlVtNJS1Yp2IvOIRvAXgomlVTtT
	HoG4vabGKUtQqSHVFa5EIDvL0XMdPVi/dnA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5ffe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:04:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-399311947f6so5574420a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788764643; x=1789369443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggxuIRingaY=;
        b=fSzIjRN54a/MpUHIDP7QNZqnlekvY45ta/axQue/CWA/hXZG1EORzPKVKFZ0QLwTRJ
         iAHI/WbyhNAwxWEyuCTnNBCR16dcka/pYAnakKdcakwdEqtSxwzCgYKi82iXLXM31zo8
         qvfCHALluy27O45PfBbnMM1lbEB0Doy5O62/L16hPKk9kp7EZWjRDOeXBJl0A2me/y7k
         Qw1e6KCy7K3GQmsH/A/oSrPl8+w1DgzcXLOzEC+GTKIvCWtE2NoK8aW1Qup9mEp+Jsd0
         iKoROELMb4dmCuLsTG3k7OeB3YYgBY53/5Zf+7tfO7QiOELxqCFktVnlf90Qf91sqyZh
         +W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764643; x=1789369443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggxuIRingaY=;
        b=B4R+pZD2lpHwcIF2/6mQJKMOpUH8UPQ72vB0RaHUGkWZw8qU9mqIQgONfOYBi33DIq
         F0syUQ3mwezPgK9m+dTGsgJipmgiizk/ZiktSCDvWnrlUKyRS+8khp52M/95A4Cj5Y1W
         ESg9CnX1F1PgG46D5ef/FcBhEp2gKaHHPrDUDwGOQewBxyqMTqcy2lwKt0TGmrt6q1Pl
         kMYuBav66uRlvh+bxKIH3QVnZLO54AU6/7MuRTFlE4jO8KEVtsXq/S6k7Gmkr63OtUWI
         GRbrbe7UxltqcozyyJShMUZz+/sH7TuAjtUongUuVZ33/OqfpNMd6+6qwVa/3dUrh/bI
         OcjA==
X-Forwarded-Encrypted: i=1; AKwUvBwEG6sMtFaZwUaL1Mtw9UbfhUTM+P6TJg6PGzDjlrbCpABXR5SJVdUQxjAx+ASPYTNNO/huaHJKO6U+V2bT@vger.kernel.org
X-Gm-Message-State: AFuF++mFq91c7WqEIGZARMVvX++B1cFtwwkcycPAjWl3vCY4Pd4ugBs5
	bxqTq2EZHoo4ROETf8+HwNQM2962COj9Wtdp0VqYjvgtnzDf0EwMivXFGjIFNrDGsnBKGP+VPqD
	IMY6Hblr4+xEpszIaLvCA3mdrb0GEJXICNdMiHkq5DfUF21AfbBiUOA53lOR4MA/M5KnD9l549g
	e0
X-Gm-Gg: AYBFou3R6vcvt1muOGJKo72Y9Opw/mX5OY1hvQa+iyzBlbjPD078hJN2TOezyb1QZd2
	/w0aY8+QWM6dSxxcR3MxDDkNHTNqHr81R4c1us0iK5Kg3RYrkFc9DAsyKCCHza+8yDgia7IbHB6
	AxqouJ6JXzu5R3QY64fiA9raiMbCS3kyTFDPA95hwRxWEzUTK0hbcCTnsRDsb/w/sG+fL4jOJdb
	zHPfz2zvmOfdlZzCZW7TbB/bMJDEcjMQxofoLB4wYDZYe5ejqzA6yDF5fPEaQA0Jr2yJksHI9g1
	XWypDrzzXlFmM6DXCyBhhe8WDTnuG/rpW3D1rWA7DUcZd1kDRxOTQll0u5wb5mtqoleFrCsAJSR
	eGdM4MAHCKEDbYPP5HAD+lsLCwT+I2UFPYG0wkUaxs3hk0K/9J/86gHYpzodRBlebEGky4HQFtg
	==
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr32080550a91.9.1788764643332;
        Mon, 07 Sep 2026 00:04:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr32080494a91.9.1788764642834;
        Mon, 07 Sep 2026 00:04:02 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26155324sm18344681a91.17.2026.09.07.00.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:04:02 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_chennak@quicinc.com
Subject: [PATCH v2] misc: fastrpc: Reduce console noise from expected DSP info, reserved memory and session messages
Date: Mon,  7 Sep 2026 15:03:56 +0800
Message-Id: <20260907070356.509-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e61e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LgK48ucg0MBlhcVu-asA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Amgkocrpkr7wai2-pPyWFm-jnYvzoZm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3NCBTYWx0ZWRfX/MU/VBuhxW2i
 ckwMCSa8imGrgXs/J0If7w0wCq67wMFyM9XcLg1BSmgSzQMd1peZL00bnZvv/RzdH9Boro5oIZJ
 cmxvOh7IemnsRzZVZQbGhuENNyrhACSvPEzKCS5wtkgeEkgsWu5l7mqUFbFMIupHRFTPjns9swB
 WauMS/KeSroPTigVilM3tq6ig8m07Lc81w4pToxhWjKVns64G191eQMM7xYZJQrdn4JTDYTy3tc
 xmiER/PrS9Gs0b5C10vdfV2wr8yq8Lna+Ux6mxc60IWDAC4IDRsXmMlGiBIJSrCp/DzMm+lii6d
 1pz+xNdJO1T8unHmIRoWayl6SX0td1Usz7yXVe+qJd1CgkXITEorZynuBuprDpI+x6ysOON2dgb
 sFpD6bhxG+O1XTeJgX0iz+MdnLLb8qjIhDgsYpXKGOJ4I9T2J9lvzkb0c9OZiVn0LceXkDUJLLC
 zXyS1xJb5Dv/ZaSWqwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3NCBTYWx0ZWRfX1htMObtfhtoj
 TX6A0UihQnHlKJyD1xz+uul9BuZ9VSYWizx5DXW2utEa+ugbEhh1jRPYMYCL0X0nZslVzSh3Fim
 PdyZ5p/LvQ/6wZKNqOCvT687e0Lxn5w=
X-Proofpoint-GUID: Amgkocrpkr7wai2-pPyWFm-jnYvzoZm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070074

On some platforms the DSP firmware does not support the fastrpc
capability/attribute query. The DSP side returns an error (err: -1)
while handling the request, so fastrpc_get_info_from_dsp() does not
return DSP_UNSUPPORTED_API but a generic error, and the "else if (err)"
branch in fastrpc_get_info_from_kernel() is taken.

cctx->valid_attributes is therefore never set and every open()/query
re-prints the same "dsp information is incorrect" line. This is not
tied to boot timing: it can be reproduced at any time by manually
starting adsprpcd. On RC builds with metadata flashing enabled several
clients come up and flood the console.

As this is an expected, platform-specific and non-fatal condition,
downgrade the message to dev_dbg. Similarly, the absence of reserved
DMA memory is a valid configuration and does not indicate an error,
so downgrade that message to dev_dbg as well. Also rate-limit the
"No session available" message with dev_err_ratelimited(): it reflects
a genuine failure (open() returns -EBUSY) so it should still be visible,
but must not flood dmesg when the session pool is exhausted.

No functional change intended.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch [v1]: https://lore.kernel.org/all/20260514062825.50172-1-jianping.li@oss.qualcomm.com/

Changes in v2:
  - Add "misc: fastrpc:" subject prefix.
  - Reword commit message: drop "temporarily", describe the actual scenario
	and state the errno returned by the DSP.
  - Rate-limit "No session available" with dev_err_ratelimited().
---
 drivers/misc/fastrpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..1f9531a534b9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1783,7 +1783,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 
 	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
-		dev_err(&cctx->rpdev->dev, "No session available\n");
+		dev_err_ratelimited(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
 		kfree(fl);
 		fastrpc_channel_ctx_put(cctx);
@@ -1937,7 +1937,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
-		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
+		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
 		kfree(dsp_attributes);
 		return err;
 	}
@@ -2559,7 +2559,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
-		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
+		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
 				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
-- 
2.43.0

