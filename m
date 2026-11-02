Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598642;
	b=Y1Wi2wVI8wFDaMpokuT44FIK0rktm7YkfqZAtLL3gZcPESUzRnZvnkAnKddQTyKJCp4H
	 q21hwtirXzEWNV+mjIW6yJMfuPsD4XkYUlcAFh2/wNq4isjqJ8F72nLwkMwbjqa/xPEG3
	 9xOkxQAcWtVEZETFNCBqfwG93CscZ5IOHm2kJbxIDvF9ZLgc9Kje/GVoz87fz8QR2DNeX
	 B0nrMaMCVxd858L8g8uN+PVBOK4NRlklS82bnHz4aZW6yATKsPqqlbtEUAbBYGkDxhnxq
	 bOrb+aOVyncYbB6Io+9R0MGylcf/4FeIQeW/17kFmz/p0QKhNzPnRl9Bgbg+ZY3C/Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598642;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScdGm+wCTAPo=;
	b=uOkKlmv9OUzO+HAapl/w0EmYKhZrHeIWZmoMs+dh2fJHUr5As9qm4ud9Dl4p+7EdEZE+
	 w07Ekd+16DlhtMBHTXeDH5IPKOTcAHj1RnK/aiaNw+uYT6BYfg2YF1YXtHAVXPQr+XeoE
	 rxDFrYo110DswwyT02nHv3j3KSDBf4FgUjV/6NreYgs1rRcpvxsC4O/xOTLX1avdNaQim
	 sBnHqspTU8V1C6KeislW3Y2j392GHPXPROeABExLDt/JE5NuJE8VhEUnV5a3CxRmMj+yF
	 QRo5NHLv33b62C9s25DTS+qknJw0cqmIyVnwBzDnYmA1496z+zEJUmgaVWrTimuoxIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=rdAvlu+y;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A5B606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 05:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A5B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=rdAvlu+y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScd
	Gm+wCTAPo=; b=rdAvlu+yv6wMG8I+ZpYKupBfVH6iqPCi43+dhf2xMuh7ceWQ4m
	NEe4pfFrQFi3clsSVr1x/zvSIS4VbGx7F5O2wLV0Khdl1gZzPcKzHVhDGI1AyZcF
	JgH88E+1pJmHJlXgmC5jRfXWziCCPnHfM71/mnttKZux2iUt9fZEVGFc8=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3vECiJOhqkOR1AA--.392S4;
	Mon, 02 Nov 2026 13:50:32 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v3 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Mon,  2 Nov 2026 13:50:25 +0800
Message-ID: <20261102055026.438521-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3vECiJOhqkOR1AA--.392S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr47Aw15KFWrKF1rCw1UGFg_yoW8Xr1rpr
	ZxJa90yr4j93WfXa1UJ3W8ur1fAayfta48G39Fv34fC343J345Gry5Ka45t3yUJF97Zry5
	tFs3KFyrZF1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jnkuxUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBOsf

msm_mdss_reset() acquires only the first reset listed in the MDSS
device node.  Platforms can describe more than one MDSS block reset: the
SM8750 display clock controller also provides a reset for the MDSS core
INT2 interrupt controller, which is left out of reset when the
bootloader hands over with the display block still running.

Switch to the reset control array API so that every reset listed in the
device node is asserted and released as one group.  Devices without a
reset in DT are unaffected, and for devices describing a single reset
the assert/deassert sequence is unchanged.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290..84b8b4bc9b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -310,7 +310,8 @@ static int msm_mdss_reset(struct device *dev)
 {
 	struct reset_control *reset;
 
-	reset = reset_control_get_optional_exclusive(dev, NULL);
+	reset = devm_reset_control_array_get(dev,
+					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 	if (!reset) {
 		/* Optional reset not specified */
 		return 0;
@@ -327,8 +328,6 @@ static int msm_mdss_reset(struct device *dev)
 	msleep(20);
 	reset_control_deassert(reset);
 
-	reset_control_put(reset);
-
 	return 0;
 }
 
-- 
2.53.0

