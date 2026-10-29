Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298843;
	b=xKTOg0xprdt7k27P8tbYHlrTMripckixy0r5D3gJZZInX19+FIVrP7vf+tH6uVk3duzB
	 z11yVm0XMfKFFqH1OT4IHl3UxQfsxUM4pSCu5jqn2NDS/CxBQp7LMQPCTm0vbd4irtXpu
	 T615gAHbFuRRYTlvb2jSQVKh5uj29exB32P0n1m/W93CCVlaX2t2z3Q9h7AkRyzmEKIbx
	 v+i+jeT+1YJNsG4D13aJ+3eFaL/i0ghTsmqt9V7OnBKzlMt7Jur3L2qki9N7RetQaQtgL
	 JcQpL7gKQuT5iOZuI9bXMCf5neikPzhGdwbBjL7QTTvC1JTBlK98qmnADnfxc5v/JiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
	b=JwWNCnbUq0+EV9R2NYdfYn4jL+zmGwjGaoFH2/MFQej6ZGgyOd3StQgW2kp5b+DMO73F
	 s6c0622QCn4iIidhOD1aX5zvDs3kCOIlGtKQ2wxD7eLkqRNMHl1AmkJdxi+y/0cUXzACI
	 lDuezUUS6Fu1ti+sUx1G4hdhe3bH1wdQD1WVqS6Rfni4FmBT+OECMLY65LL97aRG3AFbv
	 MtdJyfIn1vGo0UgwmTKuNvU/V7iwBWilFW/M9TNaA8LVnXe9tGYhYuMRmyRdQZHlz9ZRY
	 ak3S/ITAeaEnjt8xYFoUyNU2V+I3mpL8tOMyX4lmpn9kgaapYm14bJbeD2MWieXnHLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LTAV/hBF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDfQuzty;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C989B606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C989B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTAV/hBF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDfQuzty
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDa8V3234380
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=; b=LTAV/hBFUOF3eU7Y
	P+88dahkfkq+RtwhPBCqcggiNMZj/6mdi2UzlIzsqLeysPHaeOFwKM+c1s9QilgM
	ZOfl894WdEJJubhhn/3Hb+2eHOCsVcmkg5bLtUSRB6OBSeECOqEQLS7BcneJ7H6R
	+pjcyieCg0b7+zCmZjxE64TPOW3NslyXB7ykRSsxEqOw2vLh/Q1ZOD/KBTcy+w3M
	ymdelOhrGAVTesh098FiAWjsbzwQDW7tfrPTKcla9G5Q7hbVDY2WFhrNFALcb5/u
	75Rnbde1JWl0wJmjvaa7tiNzPQeKgAbR6/WBDjyM/PhratWSu4ds7sl5a0aEn8JQ
	dkkPiw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2hjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so3786680eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298841; x=1793903641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=hDfQuztyaiYlxaBgiHMz6J7ZoeXdfMexWQ4myBh/Wm+1Z09pVYrakTSz2nde//p4+r
         zKoR1y0B/iYVyJ72IKiaK2CIF5rqhQ+co7COtjTtX2IG20BrJlT6u4n3JFA9CHRpniQI
         wp/XVnowW02ACYJ2SQzCmC9wer85cLTQv7aF3OkPn0wN3msSDhb2GfFdkPCuduNKLssw
         Hw+Kl65e2HEUYa9LCa2EpTijbyrVoNaZghNMQUixZeUkX92thlTR9fPtzFYURwelrgdw
         aJxridoM3U5YidH4aK/M/ckH3G+0a6rtRu02ltktdAoqCmjg/FQWvTe6ygPuVytF0VJ+
         TIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298841; x=1793903641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=aJQ3aQOjFrM5DD7FM3NWRhKnvsfC9l9XmGRuJayzLcGGOh+7o1nzq+Sd/0WXSgomLY
         +p4/FJVzZTFFb9sAU8vmvHS/WTnnhw/cklqgM60kaRlrAPI7X7/2qUrDNZFWjB+ey7e5
         hFbYBm1s2RpnI/ongPyyL4mlL4iz+QvqJgvPCXlOjeXYc3yXT/Ns4R3xLOJs2Fuil/5B
         SpEn1LizVUmVufjU9MJYCD3iq46e1EWHoNujPjRXfQyJBSP+GJs0GkY9W3/aDOaYoafk
         SXutm9UasWeBAB0fJ2+At2Psk7opNrNwH/t9RbwDjJVGY3zLjoNr3p5OFrEDYFZEeDM+
         nQSQ==
X-Gm-Message-State: AFq9FYKjXE5CYbu4VTqjJkfhJDxs7I3xTQevNoEnCQRfUYCQsy9Jp/G0
	rJEWlG2+SXnDFS/JejDF5axveZPOzJnECQl267DIURK0v7fE8ZFfi/IRffaIlbzn86QQXajKfvQ
	2Eoq2ykjFloHomSfE+mgzVDS9THtJEcc1X7a2uzKBdUXGtBZ83cvc9ZKtbg8o7p2MBGoS
X-Gm-Gg: AYBFou1d6RYdd4tn67H60DuVMwOkTD+U5DJZR8rFdO6s/T3r7FQy4l64berFLJFwpED
	J6rR9O5jL/DzjP80k7sQE1sd9KM4sbbN4B+5xlu31l1x1esv7rJ+iD9hi9LSC9rH2obbmboyqx2
	cxBYO/j/zBwjfAMHGEpfaalH9lrdY3wRFF9t+/5yPCIccNYWEyd9LlZmrMOeETVeo4MkMpvM5no
	lgn6TqP5UKJ5YpvDXeAEKcmc6HoQdnpRoe3EuHVK63x+TFORmtBHzfwrXQTVe88y3NSZiOHiy0H
	bVHBXcXAiWNxSGmGVukLvGUWdEOFEUbjAkKnbTOcqzZ6tZb3m7Zz1626g10lmSSrPrRrz3RA0lN
	JPdTeasZgh3zOv0N55Q2mHReMckPpI+ic08AIU2rrhMgkDn0VvLHo0xKL3UvijCnfu5Fd6F04vo
	0EWWXG68bMFPh5cC2GNiFxCLPhSbvXQWwMUCt3O2iMuw==
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092433c88.21.1793298841224;
        Thu, 29 Oct 2026 11:34:01 -0700 (PDT)
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092406c88.21.1793298840580;
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:39 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=957;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=rEgskIUnrUGNrQ3rmaRBXMYPTob7wd3lSfRiOcGwpE0=;
 b=xzFtGNopMJEEx08uA3aSNHk0c67SVcSW57ix87iGRnKA9RHsVCeUTc9+PwlS18bkR9BG4xp/c
 SrV7SJQhiIOA7WNv3S2QZw4Nj1Fehl1VkpgrrWf59rWp1LzfngAGPh3
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX5cH/x8h6qNq9
 a66ua/8hyshzViwXlDIvZg3fIYH2OX2HuBFyDAKSUkVjnMl4rqPsCjdcTJfFXpNVmAeVXSykr3G
 3X4njre7cA7Q/53SjHHen7LQBiZNuCg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXzLIgoCIVATdl
 Sa6dvg8cE0NEdfc4WW7hMsqfsBZPKea7+6RNQCQe1L+aFkTx72YpslAVwZ25KdDldKPY5ZwT6v/
 2Pm6XagxqNEO6m+RWaAroex7pyxNnwaEKcXQtBSeQj2S1H4BNy8ucJobwl+ilEY+WxDJEBRN8gm
 IIg9Lbz3CIg0gHc1dmxqQW4Ci74pokvwkynF7W13thNNkFkighzMvpws99TVYNT3XhUMfl3TvDr
 CGBhwD10sSOBOObZ/BflZGo0ehJGc31E7ibrzw6zAr2yrpG+BKL4Ob2uFOSgTl5+WjaWlPLObSJ
 QKVip9ZRVNwvz33ud17XjlZGXCOE5FrukmI3w0rOpkYkefaJ0NsIpeFU+6NyONvoUq0qJU5wGRd
 9ikZ4JaIU75xmQjRvBzbM997f1qg6j89u+xZNlDoQWC/BnJkH/raeEiuDBzri+mg7j0Me3oFAAE
 9VrjkN4R3QHnRh3lIGA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3919a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iPg9V0jjAPOzTywj0KsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _bBx-OTdDlobyYrKO2aXm2T3yJQ_n3xT
X-Proofpoint-ORIG-GUID: _bBx-OTdDlobyYrKO2aXm2T3yJQ_n3xT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

All USB controllers on Lemans are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..d7d3e784f093 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4501,6 +4501,8 @@ usb_0: usb@a600000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4568,6 +4570,8 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -4616,6 +4620,7 @@ usb_2: usb@a400000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

