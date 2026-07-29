Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993142F707
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361502; cv=none; b=sIKxq97czzYSb9g3l+EcvHCCuoq0kH/U11Rdx4TO8Vo2/XUyI1vbHQQoApSL+8DSY0wWDrb8Lis7qHkvPJSDENmC7FQbabMkAQlJ31qmBXf/Y9Fw651VcCPxhhBboy9bIdRgQNga/hkWbJgmOr3SDqgG+LBzOyqyPyO4kOmSGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361502; c=relaxed/simple;
	bh=8Gj1woh+YGfKoKUw8vUcFzinjyFOvJLPqGvaI9q49jE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l6jrQ/Fqehf3AuhWWq5/d8EfsqdRMoErbYs9P29PxtetuvbDvlDxZnbaOOwbMto8AUHkKZpukwGTLDkCmKxqyhjrNSCh29sHG90+MhkP9bAO/jLw3IDdfSdM4sST9H4IIh9VMqUTEDICwZbcmShe1BtXpRMR9r7AEqRd6jYHO/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWRovRpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw9yhUEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWRovRpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw9yhUEk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TLP8CN2818165
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MRNITidFnB6lZG6QW59LqI
	d5ZJlZIn1XEPqpGLYBxiY=; b=NWRovRpGx7l7MXPQuqz1NHxQaKVCGdOmxcA3LN
	9Pa8s/krGRF0s0qrGfRo4qYf4ir8sOF1X7G6f4RQ4JzX9T6dsbDl1Dk0bdae296k
	5/YjFC1BoLXkAqOwggL1YzkV2Huy2lISXvlIDKBjg3DjsIYP4Hfdb1OKVSTatUbS
	dajcDBJgUZyluOxt64DT3FhGr9EuamPPIz12tXXy67YWk+za0SvcK0KqAbivYkWt
	UHifpiYU9xBWCJaFySUo3vwl02kYeNYnlio+eYO8VtYA53nMjiWh8aiMsF0KiQ+B
	J2ZT1INrnVQZcMppo0Xsi3cgbwaRGRXGgNTm2oaBybRdVokQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqsdu01xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:44:58 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6aca58fb7b0so407031eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 14:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785361498; x=1785966298; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MRNITidFnB6lZG6QW59LqId5ZJlZIn1XEPqpGLYBxiY=;
        b=Gw9yhUEkuP8eoAmoZAs+cxEwrRX7r8anatHGrGrN/mVaksw58bz1pu8D50vCJdn9+F
         xpJGSKamYPsdFi2WlLxPrbnkfv8/lG/2fk+0fX9oXB3vRb1jiuK974+ck6p9fxNPQx30
         PyyfJTs97/dPy75NstiBeajupZ4Y80SnRXpMdEcOE+Lad9P5lLBIXePYG8Ta6lGhG+5U
         N0dSk/FiTJkUa8x1saUwQbTO2wjmTRuX3VBevsvjgDLvRJhx6txNAQJO8KZ92KzNHUWz
         YGpPRytcTS7hi3Zpx81ayNaxiZ0t8iGXqp2FYUT5f2caqZHwN8ODy/Ih6QPaZ/WDKQg+
         pHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785361498; x=1785966298;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRNITidFnB6lZG6QW59LqId5ZJlZIn1XEPqpGLYBxiY=;
        b=maQovrlYIl4Sy1JyZeQJ1RZpXM0Dri2HjVwvWCJj/+67mSdsOxRnkwXaLudZ9iiU+f
         PaTBvu/X+VuoHF+U6rUs5m8d8hTqQdTxVMaFfRqTJZw/omiyfWULZPbOpDqGCeOpFpG6
         ldb8qpXktELYW35XuufdcpML4IaFwKA+e/7CGXk5LqO3Q1pw9QcUNbi5AGwPg3P45WPc
         7+cX4xP3pYOgJDIR3nNog0XN2LCpf0K0bA7fsmm8Tczq1BGKnkXQu2UAB8u4iLK4JO/X
         9/zhGA5o6jd9vxTqiLW7zJp7fJkVTbW5m+pJLO+a9rofW0PXra3FeO7DMuf5cMlXlALZ
         t/4Q==
X-Gm-Message-State: AOJu0YxlQZj44fsMftx8bd4TvhEqiJqtqiWpzt7MYPawpIavpur++7AL
	XomSjTtBZgu/qZVw5/YeFTKV3JgTyeh5blIM/XRFP86YRwrA/QeRauvzRw5ZWQmylDeULiGKUEE
	8evZXdR+RHyAGXgCw/RLba5017zWc17hisSqEz97AmQ0Vd8pFsw94OEhxRJ6l7jJKCXDe
X-Gm-Gg: AR+sD12ZZ45+FtouD2VQmWIoaJ7GFU0rAZVKrDBs/nuD7sQbeou6V57QKIwipOhr5HK
	DASxWmKhvEzjy9VcDSaXZshPCqGTOSHwl/JgapuFIZ8JNOltYPO4L+jIPG787jdLZc6NEWTwMHv
	VaKOzPt8HbcjEojXSHNnUkrRVxqiLdobyuxdv2K9mqAuQGS584i7EpQHU6wfsQqbfdTy2Np6qcE
	Cl4S94tuJAaUQ2Ju8iclPZeaJJq1wcLmB/pAVwD7druGe+RifRjpbbjit8vKfXVGxIQ/m/JE4kb
	4E83tLQhyWSiV1BcxVXgxwWs01bVjwQFcjvHzo90i0tbUL7088PGmwRwh/IS8+xLQ2gEOVwqKwe
	u9Q3S8fHI02dp2c4O84Y=
X-Received: by 2002:a05:6820:16ab:b0:6a1:8c8c:abd7 with SMTP id 006d021491bc7-6acbbf1044cmr93478eaf.16.1785361497731;
        Wed, 29 Jul 2026 14:44:57 -0700 (PDT)
X-Received: by 2002:a05:6820:16ab:b0:6a1:8c8c:abd7 with SMTP id 006d021491bc7-6acbbf1044cmr93469eaf.16.1785361497286;
        Wed, 29 Jul 2026 14:44:57 -0700 (PDT)
Received: from [172.17.0.3] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c0df60fasm90790fac.13.2026.07.29.14.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:44:56 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/2] serial: qcom-geni: Convert console to nbcon and handle
 RX overflow
Date: Wed, 29 Jul 2026 21:44:54 +0000
Message-Id: <20260729-qcom-geni-nbcon-v1-0-3053b96465ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFZ0amoC/yXMQQqDMBBA0avIrB3QBG3wKuJCx6mdghNNbBHEu
 5va5Vv8f0DkIByhyQ4I/JUoXhPKPAN69ToxypgMpjB18TAWV/IzTqyCOpBXrCpX1r2zdnQEqVo
 CP2W/j233d/wMb6btt4HzvACkED1fcwAAAA==
X-Change-ID: 20260723-qcom-geni-nbcon-55816a833d8c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Gj1woh+YGfKoKUw8vUcFzinjyFOvJLPqGvaI9q49jE=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqanRX3aI6fYlRVF0RhQw/Ulag/FsLYkezbbdwl
 g/e05rAg7KJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamp0Vw4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxcKbEACYmsa6A2BfakXT2Kr+YTebJ2C3v7QBgAyrJhzciZeFP6DS/8G
 JFE6AZZz4hkyp0n9yPa5NNBbXStNI8B8fRx0CQEw32Y0FUN+ScVmLV0LFgsaWKD3NBSs4kalfN8
 6t/YxUSMQkHP+TN4Hdek9ljvq6mAX4uV5gs3a9Yb6WOCpsqLOEkGkvWp75kPRqC/Eex4Zz/Tgey
 PbevkhBg8cNU2MSf1Bvddu2piC5Et0bWJOS3rO9+FbdRUAoH6k+gUaDRqblQfPAF27JZ5sCXWZM
 J8LZLSsYUdtcuJx1Ul4BiaewKkM3nm4bU6/1aG2lkhdOUzV8lLzNXsIBn7WIKpY9qtKOLBByFit
 vFsoDTj53j0AxYVye1iwIEABVhoEAHuyllxhnL0mLiDTY6586xvrWPF+fM4WBdkjVT6c4+UXf97
 ChFOj7OqJLpzcgMMpTNaGnzvFryZI2a0vQUC1CgAg0Sm9SgNsOXirwFTkufrFnHzczpWv53kjz3
 r7+ttNaub1NPcmow+62mkf00XTwva9Bwa/PQrgQJ77gvTBylash9pXPDAOSddtR2W2legppG4t9
 qOJS5I6MGxJVr/MYWbIX2wX8k0zbkhsSQxg2AyIowiLTDnkf/sVzyv4K9Pac8Sn76+NHqXAV1+N
 uSmzAEbL9m88JzvaP6zGpsdSnQOZSoSckPA==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: wKSAlooJHONUrzuAAwhrmXpGCN28Xz2a
X-Authority-Analysis: v=2.4 cv=coyrVV4i c=1 sm=1 tr=0 ts=6a6a745a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ymw6HyzOBw0-piHZwAoA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX2auG/UV39Ljr
 c+yqeVCsH2WV8vJ7ygl8OHm3ufS7Bc38TYZiQnc0o79M0ofP6eL0sgOHdfW/zlwCs/4SoCW9K3b
 pU5OmXnBraAWwu+zciJEMwICZsydZpimQDu5BoK30bmrl01cg23B5xpGz5Jk8NkTrflEqHjd9NH
 ZwVPYukQjfGiAYxSBSwipZJzBVMzn8yFr2Bqqm4BCeR4VJ3CtJdaLozoHzWMyrPNSQ9puud3hU5
 +KXJjKPxEfnHGrOpUNwwPOkQvhC8L3zK0qcY8O1oCisZQkg/muwyzYjh11SRYGPIqb4PUsU176s
 JT2pDwS6dKGnk+eby/n7VXrLNfIzgx6nXRDXPFO1eq2wMLk05b0Y8nTp5xoEp3s0I+u0UHEwD1/
 mD5QNe3rHuIsDfRLuZ8xNpnVot/eDUQbHu3Pg7vKyWN5FEkZZ39aW+UKKwYznGqS5Yb99PWE4hl
 CACYSXVwnlFTvBNFEqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NCBTYWx0ZWRfX6qmVB5Lt9Jyd
 F4KZSB0OlLRhIUX7c0csWn2lc7gk5nQkXk7iITysHQ8bZtAqgq/NGX+Q8Bs3K2skJOrIT7JNWF4
 BO4ypAcGLMGWjuI2gd9xloiV7Tq2dZc=
X-Proofpoint-ORIG-GUID: wKSAlooJHONUrzuAAwhrmXpGCN28Xz2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290164

The Qualcomm GENI UART uses independent sequencers. The main
sequencer handles console TX and the secondary sequencer handles
FIFO RX.

The legacy console writer disables both interrupt domains while it
performs a potentially long polled M-side transfer. Besides blocking
printk callers for UART wire time, this leaves the small S-side FIFO
unserviced and can lose interactive console input through FIFO overrun.

This two-patch series converts the console to nbcon, then keep FIFO RX
active while console output is in progress.

Patch 1 adds nbcon threaded and atomic writers. It uses bounded
32-byte M-side commands so higher-priority atomic output can take over
without waiting for a complete printk record. Atomic output may cancel
normal M-side TX. The driver restarts queued TTY output with irq_work,
honors flow control, and prevents deferred work from accessing a shut
down or removed port.

Patch 2 keeps FIFO RX on the secondary sequencer and drains it while
the threaded writer refills console TX. It also defers SysRq delivery
from this new receive context until the UART port lock is released.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (2):
      serial: qcom-geni: Convert console to nbcon
      serial: qcom-geni: Keep FIFO RX active during console TX

 drivers/tty/serial/qcom_geni_serial.c | 272 ++++++++++++++++++++++++++--------
 1 file changed, 212 insertions(+), 60 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260723-qcom-geni-nbcon-55816a833d8c

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

