Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523166;
	b=kOUIUCYPjFAs+eTo0pVbbaSi8t5ml8Sok6gFh3y7lZzAq5f7/DKJn4yDnveZrjbeG2bj
	 N1MNB2mkEuhxfCKO7HtFwNcvfYx3MkRz2U27UUP6Dq2Y7caTCYYfd958Q8gR+9tjOKStD
	 Y5NL4mbLsZFjFs3cRAiQzuPNhcOFwcGbdg2sG2aF1WcnOaCYOXlsu5Q4tvLz6UN+5P6CW
	 mNu4aNAVTpt2SZlseuv5s4s1RLeZbAZzoy/JTvbR2PonOgenUIOtidzoAdUefvukGoBh/
	 3bKY8lKwXwRQYNM81g719hSDp5sbaghxuwvxw8emUyj4EvSTLohvwpfN1oNH3STclhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
	b=M79v7E3+DD2uZRjJ9ROCI8M+zulh4ww3wlKAQHdwVb5TkflytKHMic/8k0mmwlazMJhM
	 cvVYVhA92WmFPdMaQsZlaa7rURhZNF1QLzIe16io5w8k2yOoQHep5II4zShhKMLPBZeLy
	 qD4X4y6OhCCoMxNfbaC1II+m2TyeWiZwRaTtXDkt0AuN6+Wfv7WTYLXt1hB9UPDk90t+H
	 8F48eB4LaPaUz4+mClPBWGJ1fFi1wCrJBSU2X7nzKBw0fSZYRaNL5BWjMUPP0yOSKuXWo
	 ijWsoo8ngXIFNBmok19fvb1pWujMn7bOUDDftcmx/fwMHIU6OXdKPRsns7Lv4JdStUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pxs/y/CX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuIg0Dgi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475E606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7475E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pxs/y/CX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iuIg0Dgi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZKo22118164
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=; b=Pxs/y/CXNp6+f9iv
	yr33sDj6/7RZBTaCKEoLUOAcWh9uhONZ9Y0gNZi08Kyv8Atv79wiDnSJG/IUum/n
	KAWJupbgZXKlS+FLVuMy2wboLb2UJ5mi1YEEE49HPhjBlF0fLeITTcpI0WhrZe8q
	5U0++R4l0oGWhe83uOKOemaPB08pA3FsQ3gSR0hsM+Wi4+M0KIhBGt9O1Lz6oNdZ
	sGML8xNhDz1OWsbvITst8LJ84Z9xWfSOgkVsYJBljQTvSYA+6jkW6KHPhteY6bKE
	8449Qj18kNkEgvfTAKt8uWcrbqKmYgZLv5q2RYHhcFQ+CzayC3OfV1E36qZuoinp
	w0FXdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdgkk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:39:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso478686eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523165; x=1795127965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
        b=iuIg0DgiuGxVKvAYMGluPCQp4myO0Ia3G4mF0lZgkRoIMuEKyweJ3KdEYsgTZ7uVhm
         5BmD2L2kRNIv1GqtR6UcFiby6N3JZ6MzXktS9ZteGrM4AdZINDUsnG73Q/uyU3Dy44Sp
         XBKcctiDmGV3pq9ouBmuR7HCq/bH5Vsv2d9l0B9oMct+agBTw9yhhH+TlayQrmPAYxap
         QNPAv7gHdKIIJYR/n3zG+a1GbBXrAPB9L5mWfaEq6er/QvhPvqEU+ZQ9Y6US2bxFwXqb
         Ogpfd4OXZPWuq6nWQgxy+4k+9qD/7T1LjtrtV118IvUurbX2kw43BXIXu9AE2h1QD236
         txXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523165; x=1795127965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRKS0AEcnZLyk4SJMKgDIkHcfHABAQfWhr9XBghPIvQ=;
        b=DFZE6BoVQBI5+dVNqTafcVIDahJXoJNBW89Xd0PYuwy6VmBz8vblbJ7uaTjT+6BtvK
         cPKDqbSGcW6XXRFqfEsH30aJgV4lcTEdk5tymbzX6+SEKQwZ8i8GE+irNok/rdqHqXyy
         3XFwypGZbbOWMQIkubWl1YJfFwOVs2hpDdjz66VMI9xKKEq1PJDyhENgNW4pXElYHlpo
         D09PwLhpVahUIzhd8iBf4qYrU/QaXtjnZAQVdKXxlK/F2FpwAmcBEue3dLFBVCUw6578
         5AiUDOUvemv0sW4SOmwGjKcsPpM6kXWodsNUtOQHCOSyckSHMq+pjKAsNp8j7kZlkdi5
         wAJg==
X-Gm-Message-State: APuU4Z/WnOXoHEwr2pHDRx0NoshGPoIP/nPgPlYKF3d5LC3aK2vZkh7G
	o99E3V3oCOVZuR2FisFL3AhzT9fvJ/f7yMGh4ROdZPTGAQbiNoQptn2vdJlwO010fwFPI6GPVJ0
	uUmix2S7XDZa4nDzFBk0lVjfGpX9j+P2wMopp5iSYyxZYKXZlxAmk6fXDbPp/28+x6DbC5fGZFr
	YC
X-Gm-Gg: AYBFou3C1xfg6rN2wJruawLpSsXRxnq7e5ACtMTkhKL/2NSgCrdgvGTzCfaHexlCsV1
	cl7U/X5iKcxpE73mjRCxb2BCXCkp512KbpZlxO/UJOCPbbkFTqaEbuoTlIW1SY7WfxoeOHxV4zQ
	bkKpr7KfEfM2mjH0NKjRnITVvTFi1zA2uv464dXkEPG4MDyCr7QErLjsppNJpGmGf0b8yb6qQX8
	CYQ3UqVPMKHUKNcxq1R2IsTDAXM95girNrU2pAgerGe5Ju1oreslpZ6n5aJJRi/IRmLj5mu0x7n
	g/Hi1jIFJrDzdoTa5H1re5O2D1kQQwm55hp0bZ2R3U+eUfLOgUzOTyAi9gN1kQEgjXACib7L79V
	4UqGDLftLpTlHzKfj9VJutBEL9vgMoVonkX365i3B8HcoIhIp80hgVio89nGjA9JxmfDOtqvv1f
	IHB79VUFZieQ==
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr705370c88.11.1794523164831;
        Thu, 12 Nov 2026 14:39:24 -0800 (PST)
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr705348c88.11.1794523164263;
        Thu, 12 Nov 2026 14:39:24 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:23 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:28 +0530
Subject: [PATCH v13 2/6] ufs: host: Add ICE clock scaling during UFS clock
 changes
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-2-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXxw8QW7rYN8nG
 pIRtxqvf3zYzCk6stAt5rYMuzpO/0X5Dfp/bJ2348HBpY7uIqtla1CN1Uc/swTrNFSv1A+uoXYi
 5+g57mvHcDe0kYByb1248rQdrBomfyI=
X-Proofpoint-ORIG-GUID: LPAT1xveb5XsT2vMVIK_jDhMg8V-LOp2
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6401d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=4vEl8bdWBwuQafGpEzkA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX2dY0Iz/2SqCJ
 jdSTYNWAmJcYApeFBtQ+R09w/svtyW27sWVzy+oPk39VZyBthD9Cd9xf60H+oKQM6Huyi42QM++
 mCS4gVqjeZEBlFaDDviYhy/NheZDE92OkQu/wT4zJzY39HWbLU7/abe7pLyqFbnh+qR4ZH/i1oA
 BNkmYZtunqlHcIR1aF/uIf8+W9GkeKRyT1pNO67dY7ukosof7Lu6Q7msTMgb9uwHD5LXSzSIbt0
 Glq/uoBUtS5ClBBnfMSo8TCoLGfbqu10aQSluhncKTdvmqGglTRgAoXCCwoeX2oBEwcc/E/eBIs
 X7ydeiTm5bEGIhinYuJl23axf5+iwmlXlohdLeYe/gbRgBHLj+pRmSOJJJPZk9Aelwlk2PB1OBF
 ggFCreTnEx0MczuzqAeNdX2uGItY4FB7OgGXznhCYP/jt7zujFSr0fzTTqu8WG/bMhBkEnKDIoS
 u1Ul49P/8R5z2/V9J4g==
X-Proofpoint-GUID: LPAT1xveb5XsT2vMVIK_jDhMg8V-LOp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Implement ICE (Inline Crypto Engine) clock scaling in sync with
UFS controller clock scaling. This ensures that the ICE operates at
an appropriate frequency when the UFS clocks are scaled up or down,
improving performance and maintaining stability for crypto operations.

For scale_up operation ensure to pass ~round_ceil (round_floor)
and vice-versa for scale_down operations.

In case of OPP scaling is not supported by ICE, ensure to not prevent
devfreq for UFS, as ICE OPP-table is optional.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6afb8498b8c267d0bbbdb1e14f37fd305c71fddc..5019803a6aba4f649972e2ecdafda1e9e38fe2ba 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -307,6 +307,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
 	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
+		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
 	.keyslot_program	= ufs_qcom_ice_keyslot_program,
 	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
@@ -341,6 +350,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
 {
 }
 
+static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
+				  bool round_ceil)
+{
+	return 0;
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -1987,6 +2002,12 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 			return err;
 		}
 
+		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
+		if (err && err != -EOPNOTSUPP) {
+			ufshcd_uic_hibern8_exit(hba);
+			return err;
+		}
+
 		ufs_qcom_icc_update_bw(host);
 		ufshcd_uic_hibern8_exit(hba);
 	}

-- 
2.34.1

