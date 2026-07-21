Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914536BCCA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640827; cv=none; b=fMUIry20VDs6t4BuskubE/VwuKbieAt/yQS+DUuRCReSalIdN7YvYbGEvxan2Es1yIQ8lpladX5oDfEGi9eW1QablCNIRjz+spYzViB3oHvZz4qCEqrsc+jA9PpVmkXZCLE4UTUsKz5p95UieEwqw/dAW1HugL7Z72kDJ4A1X28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640827; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqsffoM0P4gplFDAD3g5vmiu6qpfp7L7YCshkyAa/Ykvomr1klQt5AlYKZUywLKg61iPcyoorDEbEXHCGJuFtvRQT2SmzG5W88PR4MUL6SGit/9GGn5XTOnSbE6v0EeTKbgIFDOx8HXWQvdIlEpi6VLrhc4MSYK1tcnLHheBxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQJNAIvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtXT2IVl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQJNAIvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtXT2IVl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMOF61351996
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=jQJNAIvHvUB7R3vB
	AGOxMJAYulIc3vYqLX1z1j3Wa+nXzFGTJMtEDIybTzvOKPwH5l7zvpz8xMTEf+SI
	sWUN9OdF4Gr3e1ptzT/WjDyAVsAZ6wPChXwLaXD3jriYJ0Ab2ELdtseZh/L6GIQm
	CFEhNpTITPFEfeDAwy+h6hBLwhnI+6dgBwrDYYHv3x+s80b8g1khJ6pH3pmdj9AF
	f09Y38joVqkHXlk+QiEsaEsne8mqWosoXZ8dbAHSyAk1k6uI83YPGUE2Vpz+d8f9
	2fHhRdFzcI6AMZCqz6JCpeOEVOpjov82Uvpf9e/8btT0hdm11hokvGCUk3hwzkIU
	NeQ+iQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es2krv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:33:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so100881141cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640824; x=1785245624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=XtXT2IVlqTsE8s0ZMrLIewEW1SOLzzlZ0SMopJ8hNWBKL8hPprBTpvRMw+gtL77BQe
         Hc+s2YSDgOCTS+0D9fBLP6kycf9iBtttuzTNGovPeKnkSChnCfv5g93lpCjywEQUvqDn
         DjImFZ4yIwT47APmZ6SMOPZkcSrWRA3VEcdU+DYQ+TRAjnHIhIXrtJe/80lXS/5brdeP
         wJeaDfuOLYklDte0HksJEiVNSG4WMx3LMv7LtKyO0rDKUO3NI63Fy3VAicYu8qRXkw7H
         ccW5/GwWf/DBlhrx1YWfIX+Oyg+4H26dxK9UU9eS1Z0Opz+AlnuIR6+inSGB73gQN+Cu
         F2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640824; x=1785245624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=BZVD+Bv3aNS14oo2OdCJvuEwXUeKgg77eZN0xemYhyPhBl9LUJzuTyDSLdOIGO51iu
         VD0dfBfVTCSOoxLyApNpTXbXN78/M3dFRGgljRk1C3RFANXbp8cngI+OviEDhAljIkv+
         34PoFxLoFoTiawdOGTxaFf7dW8fIYzN5XJutsRjZe23FbXt1UQGOq87o6r1kh2pEOsGo
         sBOJXCylFMEf5G98J4qV/vk9nsVNZG3wywlGvZq8tOzgQPxxt0AtrNzole059u9mwJ7M
         mwtCvz2bJyG5PW0r55BP1ddc05f/gbDE6PZwispuHTH5LFDLoH2sqnBEAuSLkZvACI5W
         Gn9g==
X-Forwarded-Encrypted: i=1; AHgh+RpyPCOwDHh/A/p5QrmMpo67rc3S1Btdf0MFnoT5x0zNZSIYyC+W4f1WdM2+4zEK71X3rwQLqAYTQ1L5Sara@vger.kernel.org
X-Gm-Message-State: AOJu0Yyna3BNA/nRI6qo0lWZc7J2xLYYyM12tdtYzQYP8lxtfPhE/TsW
	pnNdiNxefbvMQViqx/4ZDvwcl3Z4Qhxe3bSGdMrjFcWW+02S5FKNID4O5FEfAKZGukPujg/UNGq
	pCfuF3DMd6434YpCKqmqAxVovWA7d/pSPib5C+o/8uVMoEGYJtJ9OO2qFpn+PyyEPf+4/
X-Gm-Gg: AfdE7cnjJh+AW/d8rSx9n7aF+Nr6I26ZLndTYk9nLXOeBWnBTnvWUPfHmDzc7inPKbr
	SL72/u/iTFngv9iQMVTeibdT1qpU+EvW3xnOu+1OrLwGqO0DDHnG2ljlTnpHoYCwyc9HNSXBsOk
	5F1lRkM51OEzYc4Es5yxbgaQzL8IQYAQLjHTy5sOO+7zvwMUrHZzyn1OvA47iSgLcN62Cgi8Vtr
	OqdtqeVgGCiuAubUf/6xWLWUvCkDxNGvutTyEPeFw+q6qmGavA/xdwvZLbQw/rYTYl5nkeUOCFr
	R40U7+TnFoSkqLKNyUJ4eI9TzW70kNjkHgGdvZuVwQHdq7o5lrpPQCD7RQlg2c+xsHjQK8Gz2Db
	HSnJeYFPS4RRjv5HXO307YHyP7s9uug==
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163913371cf.0.1784640824499;
        Tue, 21 Jul 2026 06:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163912961cf.0.1784640823889;
        Tue, 21 Jul 2026 06:33:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:08 +0200
Subject: [PATCH v23 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-3-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UfbWQcFOVE5hNy5ORpDyLVvvPVlbwquV0eO
 UIZtQ4iqweJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HwAKCRAFnS7L/zaE
 w9VzEACVgd2ByyZhxiiqIrqQ5VRlo7dmVYDYtB+etZcBxcZUXxwbXQkJsT5wyOvMgREkMdqEmJv
 a6zK9M1ajOkxL2P0RjHMmlxUKrJMIXEkPLasXDg7cKAtVkhtDLq+XaH9nEGMtZhU0slVi0J9v/u
 aXLizLyRua8zHDF2qRY/l7DrBa4vjampFpyvAORJyLn/I/44U9ebJwvIt7cIywP/H3bRNmVFrFP
 37PjSkfSxhBj9UyZ3ET7LozvKFCN8sGILU53dptezMXZHIsdSEjCTu0IrUShmz/mPEQcqA+rQSf
 JFoOYkQnhF2hT0riPA0jnFMKX/AlYVveILEWx/0syGzaAQHtPZvGucBvwaJrIuwcaof/xK5qc84
 qeBwJXLnoMuFmFIKmp53gYRYf9e9zvJ4PkoF5CzjUWtwi/AwBGhbdD83zv9mKVI4JBLU+ZLCGZn
 XU/YV1LO6Ojy/GQLvLVBTCCugiMDZsUzcU7IL+miT+j8Vzr3JslwIcZVTxtDbxbRcxIheDxRl6l
 U6J5HgUUSTygLFOkmXZ8Ma5PuV3hUVyWnIR0zo/g2lriNjsVAm1GmYr+otWQTA2s7pZmrCkQa83
 z5GPpoFEv/4OLkJbAige40aX80ytzB1XyGIDPQNPGetlVq6W74B/4I0FFE1HszG+usPq8KEYpJH
 35qR+l4u0wG7Y8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f7539 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iL1WNHHoeZ37wpYyaxl6xAtdYOTRHGbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX87UvWyAWgaRZ
 sModLkuG9fMJ/W1yfkWeISkfHI3bT7zCNf068+Z2SC86twSOgiAq74Tc8lSRxFsUByH3UX0bR16
 SZeJMesYGo08eetk2vvzWjnHsupAlIEIWa2rlG5VYxISGhoB2I520iFIeOOsYKNq2TM+lEOG/RS
 YV+0+oNOMbf2+sHfAwHt3dEGj5nXaHISz56yvywZHFm2ANV1fTa/Mj55jg048GYioR6f/SV0/M5
 SIzv+ehIPfNvIQ0GqcZql4wY8Kl/OEX7gPkcxaF29Ps/yK/aDVwqprnnK0hagLhzOZTuxOyrhFf
 yyGicncr6LlX42CjLFtjt9DhSQYp0uOAs8t++CX0/Esv+sh90b2OQyvpjaIYzlBapYTIYlDdSuC
 AO4UEINvT0sgiV424dWTs9FiBjWu5N4lMnwSKKXdMf/G+3wTbETU1DmyPzJVaL//Md42pb0+fWn
 8cniQQWqMCK/CBIjkjw==
X-Proofpoint-ORIG-GUID: iL1WNHHoeZ37wpYyaxl6xAtdYOTRHGbx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX9OD8zcgPoeJx
 f22+AkwZM7DBCuSLFZFnwElTpkMBb24tyWymk4PHybgtnQapFmxhF2HBsv0pJmwZSCx7d8v0kJG
 XZR1T0N25NmWedXBMmLLiIDS6BbZz9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3

