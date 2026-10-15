Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D20A4A92C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048542; cv=none; b=G6cBdQYxARqc7xI8ufKYep96O8t2LD5Uqrd5G4P6HfhBiAicE/dYzSpX6TCI9v8kptNfFbgxeCCn8hnXG+OPRLZC1E7FD3EkXpfJZpBGxJmvRlytvfnsREvrtx1ftik4bBaIoRIAZr1XWW3IboaYyzDc/juHxhk4AkxVnl2EcTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048542; c=relaxed/simple;
	bh=fMCM/EJ72WgLCh0VQxXmiSA4rBjnJY2LoLwbQn2sGtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sduBUecqZDdfEofgo6aDMHOkLWWNV5Hknid8xaJAm/Hd2ahOfl+Fsnd32yxZLiZN2LLGJCK9lih7MKCIKu6lJy5ACtC9w28hSuoHjDYB7C2ooQRPt6n09xDepsA2sPawdPuJHwRKKT2T+AJQjCs7V0LW2alR3EDSIeZTjx2v8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNSVTqel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gS663qyl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNSVTqel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gS663qyl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wbNq1889509
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=++KZLL3kpeg
	YS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=; b=UNSVTqelSyqVOBQckw3fEUzRYQB
	f+ClcRa9QvQnS9Vzu83wyNYRn7MTAzhduvcngPFXgANf9tzGivSmH6ydVibmTbQF
	7Q7oLaf9WBdUCvs32oJ4L5rq1yxx6xf9kFBLAJBvA86JyIpMUKmPsjmTx2TArH/7
	nPtgDffjsV7mlAotVvdhK+wmJtiClc2fMHm+CZcFt96Z0PlxKszPzDCLv2Wcupkd
	atPH2U+o+cXstG/Zm4S8IMvdJ1e8dwcTZVoDP3sQUYEHVf+YXISSNy+Db+tLNp6W
	W6hyN6KnS1A4iFk14wkvgkPsZMRN0yPn6ZbMLynrs+ymf+2SxlZyaqQbUdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0pgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2367645a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048530; x=1792653330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=gS663qylTgtzYb91QmfMniTH3ZH9VAaFHlhPAvHx75EhPiU/RUzSf2l1IFMjxzCPn1
         b4Lfux0it8ALzQ+gWlHZPNUhQbNl6y8ir6wxUGW8TVh630ZPt2N7rvcnrHIFh10oC+cW
         Jh17ujXModb1fmYvwB8TZidmo7/Zzz7jezscoaMZRm/3bc95D/9/ESzfmFLtFgwA33I2
         1KlWwiYTEuESwU9frbb8hEW9UBXsX/bLcUBF13o6GdWqiI/HLwmyUgymhCr1oSpkn46a
         MWT11EBfFDxBRk/nuuy7bV29OOcNyPVyFeKB2dnA0vaitvo+AKnBFrLszOcnSIE3A8IT
         Gi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048530; x=1792653330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=142TZw3A2r2JRI7vLr7AZEdniem4nrAXHiWWyFNoLu+T+QAfLs9KNP3COjeuGcqRW3
         gD6xnWm41CwCtE/kBqswym9rGF3ANb49lMtPdO0yAYslqYlVnN13w8BaZrWStXAYP/kM
         vI5XHIiqjNY5fE2uMCe4ox2BpgSOs7iQYby4ySBlL+hfzmhefVi2N/mZaSNl+PYThSNs
         /Ek+1bkclRyqvtGxTPBB1xU71wZsZj7D+8zPZ1miM9hEIT278REfL3LEWnCyEqvQcZ75
         tsBPYk/VrJk2SWSOUQgKKDAVc55fBJrsXsSD+tjDE78au2baT0cJFOyABUvQvBt3QR38
         yEBw==
X-Forwarded-Encrypted: i=1; AKwUvBx0fbbPW7PlIuyoVAKsuEPVIOrvQD7eACUCi89vg4od5pbQdSeFQXV/luYlrZQ9xGZLhU/OEbjr/ozKzJZU@vger.kernel.org
X-Gm-Message-State: AFq9FYLS5/NpAMOZQYoQL3PeMnG4+mF7NP974/ow+/w2Jt2t7Cpz6CSE
	WuXzanJp+dcHb5uleRAmFWPYNn1tFTR2DGH2OOQo4dV7ykzNCjonOA2vSCHKO4Oon1JEE8H1jpw
	fKSYyDWEsNm2wDHBtGphJAj4XBRiB3jj3e+nZxJJE4BlWjLYoE/KQUuu8ye8+LJl3Ld+e
X-Gm-Gg: AYBFou1srY4wk8QsXavIvIi+CsvXnF06pZXz6wqQMcQVAmYn/CUUvS9O5PjhvVduSVi
	rZoei/jfvnrU/b1ojru4OvXOkqJ5yufjXZ22Ff0HHoEV2u1PDeIHCwJPrYvijeTIOwCmZ1ZtLpL
	35WohXKCeldlWEFdk7Z34+BKKym8Ucvphhmp54FM1SynEOdoOl8wiVF7+muYnSuWaXisnGlKtIp
	ov3ccr8B2TRa5JTwkJSZndgqc6LS+OCtp4K/5U+ruI1N15T3NFx1Eq0lWumdzsvJPnoLU85lmnX
	AN7n/nrm/dCCqoCwp3azReSMraQT/dUFdKgxOcbuHR3Dxqv89QFdHfQBxNj/2zJHUwT7902mz5P
	gyoEqpgcBka2yloqdPZyMRa371RnWRIyiTnEhdw9JpiQm3NmA5dXU7kJly/8xwZFWI3ekiN08
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593993a91.66.1792048529517;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593971a91.66.1792048529040;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:09 +0800
Message-Id: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX21boZ1S35dAV
 6afkycRyz+5X3OzBy/PTrJSwbuHFJ0c+XK4rE8nNFgTHfcugraIFo0QL5whhPeMiiJ4DQ7aET4S
 6z6JB/yy7zh6EEtonVFDi3eH2wHYFcs=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad07d92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CgcdhG9ooiE7Jmpo-HsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: urbOXkw1ttboXsRURQi7u4i8g7YJLCiJ
X-Proofpoint-ORIG-GUID: urbOXkw1ttboXsRURQi7u4i8g7YJLCiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX5woBbh4TBwHb
 GEVYRS0eSDJgeRlqY4aXAC8env54D8N3OLVHUnsV3BrtkrIhTiaf5Jj2w0j+iXbDtgthsYxad+c
 HiM6hFOa1Zk9tZ5qOdF6j2DHoi471AOhRFrSpwOvIrgjFZg4H/YGjoN/k0CbvqT7Nuvq+nd55+B
 Q/ABD5Z/ybdyauH9ZrcmEwWnzEIod6qEuulLqJozvZ1kdPVseCRLlBZdSRHMSdTqrWUmoME4n6O
 HhhwmhzLHlnPL79kknlogQqcKKV2x6xGIyVGBOYLD3GPjSO3KTMH1XH7w7sE3myGshx4vTReOLr
 HM/IKYd76oQOuKhv3zhWanWQN5Ycjoxg+eW3WnGymZpFl0TkL5B7rR9Tt18A2sIZS9GZArlq/jy
 TF76+qjytG6mA9rmqSECAgNlhntwSgafMuwyI9v1As0vDUYKOh8ECVhwbK5ZpOncYkYwKVblaVf
 q6eBz7fKE+twMhtVccA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable shared DMA pool.
Allowing the kernel to reuse this region is incompatible with handing
the entire region over to the DSP, as HLOS allocations may then access
memory for which HLOS no longer has access permissions.

The same configuration has caused synchronous external aborts on
other platforms when the kernel accesses pages within the ADSP remote
heap.

Replace reusable with no-map to keep the region reserved for the DSP
and exclude it from the kernel's standard memory mapping.

Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..4b7907cf9c82 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -690,7 +690,7 @@ smem_mem: smem@ffe00000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0

