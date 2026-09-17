Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A9486BA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628926; cv=none; b=Fx+UJ2ONOvPGYGK11qoHIr3l9v9D9mvhX4f8JUBW2z75CiCTwyyNLpMDr707ZpnXHpp/bNpevhV2+wpjGN5cBSJLiJJZ4sdfcvv1sxdUhqsaZuLenAiLyiBcap7fatMUPJ5ZFHDHVW8N99ZfHToIqZkoG30lyLaItS6v/69Kho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628926; c=relaxed/simple;
	bh=DWQkc7G6x9/l9HXB7zRBR28OwQe/issVxWGt7hAyuBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHNABTXz0+Eajwoxn5Hxn9BG5If3RX+zS6zYj+TonvgpT8/6Mo3bhxJBY4wcmjQbCtycxu/hqxheZn9RVfIrmVrV+RL16KQJGc9lklHNydnl8JOWJciFKYxAUNS8JJJfQy+6B4zfMtOX3fLS+Mhq3tlf2U/zLsm4D+BCDaP4epA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUcIzge0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=df5g1zGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUcIzge0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="df5g1zGw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60gqF663113
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=; b=XUcIzge0pfaj0sYs
	Wr8UXHRK6IR2oHrG56gHmPdQjQMkrycO+QVrsSXdWAXxXmdZMx31lp9DqCrZ3v5H
	E+/azQcs0UDg4MOn5+shFlNbaFg+2kZHkAxp3mJOmNhve/hiIv3qvmiQCBYxJBAH
	p70VesisGNvPmev5aqLciOnE91OjltxyNDuSK3hXr9eIp58x71jbdOaMMxTEAYJ/
	KE8FXPuwFZQsraxc+No5fEnyVTt6hdrTKSVtpLOiDJ93A5zE+DMvsMSZS0tWJTQd
	xhaG8GikyU6vA0c4uCLYB4FsQt6EAEuxsoQGJfzxJLz8uuQ8svO1JZZDVvU5gZgs
	fTHO2A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga2sjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 07:08:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b3962f71e7so857668b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628921; x=1790233721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=;
        b=df5g1zGwCG+GUHtGAG/FQvZAsyMMPTcU5l1RT36TVKa31xIlDF//R0vVToM5daATBC
         AmTagvzQJU8R/ACrCv3b1o5sG+BfS3aNeGOEu8+vhLPjsPhfDyb+4ZVEC8mrNbdQ0qPU
         +/JViF0aTRanqQJNm3kfXJyo+yO0Q1m7nM6DLFuWQuFu3Epg00/I9eCpYq3UB0TcnYnE
         BiWXIjw0y8iiwbNe5PBWWKJcHCuv+LVFhqLeA/gfEw6VOQ0ea2rAJIkeYeKZJMHqhvY0
         S9k/xaGRziK8unRYMyAYf4pkhm3Yu8SNXSbsxRomble6Z86hQVZrwg/XZdsRdGXoKNyE
         n8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628921; x=1790233721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=;
        b=N1K05wCgzxGhq8NAlH4s8QeIDoII134nQ94rh6+bUxb7e4GBLt7l2oeOZ7vpX9Xv6u
         xPU+8n9GHlzr+sFWTl85GvChics2iUiqlOf6NkJ9l6ZrRtzPWjDlXZ3mCGBVeRLYTZHf
         gKgQUSHFoucv+cV4t02RV/VrT0gN89hPPZx/1kNdsy5lC/ZTb+4VEpRQAd1fsqzhFoDm
         3wYar0JE00qouW0MaVWbVNij8GYAUN322TZDLUzlmdlQKjXAOhs5T9013IohTyea7pe3
         eLeLAYCcHe2pQLFmgDpUGZYX4rqXvDmyWVe7bZf7WtNFhsa1ptSKi4+zBz4KJKW5pbP2
         KsMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsJ/cM95L5ycxIUjwrJDiemWiAB8ftS6FmGJSohqZU9BttxkHPkc/rkGVZr+iUHbr6GgThWMI5/2bzcFu6@vger.kernel.org
X-Gm-Message-State: AFuF++mAUqfvlhooy0xHAUF+HgzqRdIzWvn35j1bgdLHHXR3ifMR0ZUw
	qrvYmI21evMkET/YIF70kh4RWhRhxbUNPHHgERD0V/o1HGYP5Dbe3+/Bsj8yjVbrX5h6sHvh055
	kqkjnQZEJ9oy+wfZ7/ufqpefRLYN8dq+fCWv80Hbh18EdJrZRBoocjMbrtlPj/5oD5OPg
X-Gm-Gg: AYBFou1mjE2VnBAPEf55LZxa5rhhfRvQysUZfGNoJa2O6gRXZSOPqifFdB6lUY8+eOy
	GBFR07CigqIrvC9CI3fZsOFdgEuV4byJ6rQrANwv5Dk2kS8msJULtigBhptoHi2pquNDt4X3RJk
	gIF2JfgQl3sVyQBPqHlPz05Cgt5JR6KrD4dfYZPfv09on9HmfEmpxblGQsVuhagHohvXe9atCWu
	zoufkFNJVpmRs9qshjphIWv/z1ekziDDx/pLiDIXJUUjaQihOsrKNHOZ+102/Y0TA2IKhH8a29z
	d450CbjFUEAAgnx3jvkBg4O3fmxNpYMLW6O3TPUxdfog+BC/91D6nP9/4FyirZy/T+Xmm3WJq47
	Sgu+2c7dKl2TFQZGuqTJAdZNMOYLax6TOubY=
X-Received: by 2002:a05:6808:1782:b0:4b9:a8ac:47e with SMTP id 5614622812f47-4ca4c283485mr6719344b6e.28.1789628920721;
        Thu, 17 Sep 2026 00:08:40 -0700 (PDT)
X-Received: by 2002:a05:6808:1782:b0:4b9:a8ac:47e with SMTP id 5614622812f47-4ca4c283485mr6719320b6e.28.1789628920293;
        Thu, 17 Sep 2026 00:08:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:39 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:04 +0530
Subject: [PATCH v3 3/6] bus: mhi: host: Add support for 64bit register
 reads and writes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-3-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=3724;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=DWQkc7G6x9/l9HXB7zRBR28OwQe/issVxWGt7hAyuBE=;
 b=MEY/Kgj6zt4Jwmsz9JirKEr9cooGz2obeJh2fDuBhTYOvHZuY3ZS9gOWbkITFCnH3PAZZbC1f
 2OAIbxunUWAD4BoQFAANvna7ar2L4xw7jpHUuEqswyWyZbI4TO/nPr4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: KEPnMXDK0oL2AIEwVZZBUrMxwET02vZZ
X-Proofpoint-GUID: KEPnMXDK0oL2AIEwVZZBUrMxwET02vZZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXyn0j7lL5mSY3
 oBIomGJLRpmTu0KzJtHvpBB/zHgKlXDmIgb4zSnJsBWYdcMngNTYwCvMzpXj9tcqcOBKr/O+ot6
 9TXuHD0Azc49/kac+1YaiwiS5Rmd0NA=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab91f9 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CnzCB1l8zP_khqs2e6IA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX9ZchawD3uTTH
 tZBEAzLVOtKxewzEXGBZIWma4/9Pawfo+L/GvKi69sVV8UmgqNvedeH0S/RYOKp23kirpymB/Cn
 WaWWILk+SuIF/Q3XEFz8YhkbDzYzRpirzZPw84c4tzRSuxA49NIAB/vGCm4OF1CpS/phfxw3iKR
 tTwyYvqoA1HQFbX0Q3YwOjder36QT/D5QoUcqBA1UsNA397T4w/d5UX0LuMOMRQzTSWyDU6hKqX
 PQtJsJrOakRrf0XNSz/4zGuChlvRy8FVPZXAeGkimWq+xxx2COHBb7qrZo4VbvbRYoQK1VeJX89
 T9Af5UyQY302LfjWsxsKhY4FRiFm4e9SM7xWyQhsd2QBeFU2XaVD/TLuD9kylVTfUAPgpO2YOJw
 K9CH62S4NqrGQDhWcud3K6wPuvVBma9fu+gOsiP41c2Bt1XhzmSU8L35SHGa1h1/wtrioWtqcml
 d1cY9uqReWzyYyR0KMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170094

Some mhi registers are of 64 bit size, instead of reading high value
and low value separately provide a new function op to read & write to
64 bit register.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/internal.h |  4 ++++
 drivers/bus/mhi/host/main.c     | 13 +++++++++++++
 include/linux/mhi.h             |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ca50961769fa..bb96dfffabb6 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -386,6 +386,8 @@ void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
 			     dma_addr_t db_val);
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 			      void __iomem *base, u32 offset, u32 *out);
+int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *base, u32 offset, u64 *out);
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
 				    u32 *out);
@@ -394,6 +396,8 @@ int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
 				    u32 val, u32 delayus, u32 timeout_ms);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
+void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+				    u32 offset, u64 val);
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val);
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4d458396233a..bfeb5cf53448 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -67,6 +67,19 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
 }
 
+int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *base, u32 offset, u64 *out)
+{
+	return mhi_cntrl->read_reg64(mhi_cntrl, base + offset, out);
+}
+EXPORT_SYMBOL_GPL(mhi_read_reg64);
+
+void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+				    u32 offset, u64 val)
+{
+	mhi_cntrl->write_reg64(mhi_cntrl, base + offset, val);
+}
+
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index e994ca4f9810..3dc1844222cd 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -374,6 +374,8 @@ struct mhi_controller_config {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @read_reg64: Read a 64 bit MHI register via the physical link (optional)
+ * @write_reg64: Write a 64 bit MHI register via the physical link (optional)
  * @reset: Controller specific reset function (optional)
  * @edl_trigger: CB function to trigger EDL mode (optional)
  * @buffer_len: Bounce buffer length
@@ -461,6 +463,10 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	int (*read_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			  u64 *out);
+	void (*write_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			    u64 val);
 	void (*reset)(struct mhi_controller *mhi_cntrl);
 	int (*edl_trigger)(struct mhi_controller *mhi_cntrl);
 

-- 
2.34.1

