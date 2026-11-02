Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598647;
	b=TIvWkRW1WxvXH0T7xBaLPFTkYmHMnzW7AkBjc1TfH3pcNvJNaJTYT5lkd/PYfXf2dZ8i
	 DCQkTcGH3fWCndhO1UDREhPmdVPmY+glI0zJhODowYrWSLU5ncRCnnZVLxE3So3vT9Rd4
	 bJuvRwOhzbIuQh2DYIfU0vlM4Y3xG6kBRzin+zBze+Sze408pml9arxSSWfTX5NC0R+wF
	 eSuRVjIjF2gGQmymNm8pf0p+OUICG2Y5ZiMtxShWE/8pDQwADN9JDj43x/4Ao3FJrzG00
	 QZcRooL3WyQaCH8I3dQ0QuF6UtFzYcSU/MYlTzprUtuhvL/wtCsB2QNtX8JYtnZjSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598647;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xGugufZddxfPXepALo03gZN/09aVikk9kAwuDQoK1Es=;
	b=xtBveWKvwynj6MqHTMF/Taq+jiddA65hP1eoFLiHC+ERESPLcMxUjHZ9NIHBnNMvONpr
	 rHa5oY9vAX/4o+KfQEqOiJ6lwkEsb6B5NQtvqRttaB4dCGsUThHsVp4pw54eT7Ecag+lf
	 xyzwm6on8unLB50Tul7j5c2eHxf7VBnRYcOkOJUazJijx0jaXaST97ZDg3lCsqWML7RS+
	 1AyQPNAEFsaA91lGlZG1XnjER2Pbvoa7j3fpDA/qVgIETm+0lHmJF759L7rilghTpje0H
	 6ohnnwC+WASV66SY+m0reonhzdEOrBlv+5NkfjKN9KTIGXYycHUke/xIMsrlCuZDUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ej0OseXp;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758C5606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 05:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 758C5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ej0OseXp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=xGugufZddxfPXepALo03gZN/09aVikk9kA
	wuDQoK1Es=; b=ej0OseXp+o8hE8fFQ8eVZ0b+ZMpF6oga3aw4GYUPuvcpqerpfH
	5jTh0v3l6BAA+9c+M50jS+Cv5dmwUxHcllYE4T8OYNdHIYYvau1L+x9HwZCODDaK
	5+EotK09lOilGGoUR5vqiA95Nt+YalqiDMeF46GGBDfTb2kHFdKMyVbcI=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3vECiJOhqkOR1AA--.392S5;
	Mon, 02 Nov 2026 13:50:33 +0800 (CST)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750: describe all MDSS block resets
Date: Mon,  2 Nov 2026 13:50:26 +0800
Message-ID: <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3vECiJOhqkOR1AA--.392S5
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWkKF4UKr1kKF48Cw1UGFg_yoW8GF1kpr
	n7Za9rWw1v93WF9FW7tryjgw4rC3Z5Kr15WFnxG34UG3ZxJrn3KFnxtFsagFyUtFWxWan5
	ur47WFWIqF18C3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
	6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jn9N3UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBPse

The SM8750 display clock controller provides, beside the MDSS core
reset, a block reset for the MDSS core INT2 interrupt controller.  On
devices whose bootloader hands over with the display block still active,
the kernel so far reset only the MDSS core and left the INT2 block in
the state left behind by the bootloader; command-mode panel
initialisation then fails with command DMA timeouts and the display
comes up as backlight only, without a DRM device.

Describe both block resets so that the MDSS reset returns the MDSS
blocks to a known state before any display hardware is programmed.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df..e8e2832f91 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3071,7 +3071,8 @@ mdss: display-subsystem@ae00000 {
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 
-			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>,
+				 <&dispcc DISP_CC_MDSS_CORE_INT2_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.53.0

