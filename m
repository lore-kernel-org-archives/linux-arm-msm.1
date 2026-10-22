Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662649;
	b=5l1XxrYf9i5a6Ek/FMYlKgawZhZOR8ETn3kDPG9Sag84YfidHuGRCmiYQHOt+UNsrCjz
	 KwMiPLjjVrr76PsUpr+ikQDvDmpltAH7GLZN5UiBjEGFH4Lj5s6U2athFBuU0vEdU8Fvs
	 s98Vpk9jMe2Pp6wmqfYc/laq8QGQFfldhV1Ko5gisZo7eVkxKNgeYgNUReMBHO0fzjwxJ
	 luFnSWzEqn5AQC7p4nIccW5P/8DU1KB0vhSdtZKQn2F6YzHbVBl9NUkR3j/OAfDm41ybX
	 of33qxr3vv78d5gtGk7NBZXQxFCQo87AthAHffNxXz7aIGEGBtdZ86VlVapZabcaXzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
	b=Z+L2FAtfSQksXIVMD681DUY/Kl8cEINQrKGTpeXu/TEBlo6rYneieAL70pBSSGMVpefw
	 l2R7aXDHVpYjtqB4NNIvZ6AQ3zjkKnjOpqIiCvmtY2rBo8gpxckbRBrrHEhVpAUpB1rMU
	 i+iEgRRGKnsahf75Hbu/+lACGcTMR4GrkX/4K3/oOjO66NOFhPFIsFJuIm0TzMOxaWXwQ
	 LMPkw1iKnEq+YWRLiDHm2SBnG6tMaBk0Pflq5pRF+/LFQVdNEMbSTjYflcxLL0j2K8v7h
	 1dRw9Cizck0BdGzX6kopKOlE97HGze8WXsQv+xdVbxHDbZg5zceOCHVE03HqbBWKyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79160A260E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF79160A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTT41qsh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eJLjJ6AO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M95x953305784
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=; b=HTT41qshpAamlNKp
	XkhAwr/7w2gIL+xH6mvR0Lv3CPG9e8dadkJfJTj69HK1GTHzuNPyxu2xUoWlSSfZ
	Aer1ZhsCH7GsK0iQ5FDa9iZhjVIgBjmz925qrTZOKREBiPrdw9O/ZPLd0Zv3uyG8
	eB5+lrJ9VepwQPapibS4LvoJjVHpy0P+Up3mPrkd4mkw3STfJlv8XNDt5z88qqdV
	nzeJ8Q7KSnYkrQl3Emuulhb4scTyy6wXMy+dfeycRqtP3vF1Wi2njdLwaSd9Z9pA
	O8ta8o+UcUQE3ZYsrr1QGUqcZvVjc4vkRnjYntl79M2cCgKQgJNolB5QWJy58JW7
	3WfCaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asquj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:50:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3155735eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662647; x=1793267447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=eJLjJ6AOJ3RsfD9yXaFtoGeM6rF/piiquIb0Ci+GWDhOvgEl7TPdeiv11nntKOGyPY
         ttHTqtaP1MQvDnj+DZmMIvepqnaU7g69uh14OLdfCcg6xIQI18TvY4tKDseaVVe7KIsV
         ndbGUSCVgSfoAsDX2VITJRjowGsr4Dg0vNd1asnMcPMmOGQIa6vukH0RiuoYVOf4Ti6H
         JY5EFdznd9a4DWTp2h+hfs3QjQk+ZssTLJYhf4UcQdKqQ8IrDM1RIPkh0PKWC8x83H+3
         C0Qjabb+iULh8nxiEer70/m6E+9W5k0m2Mrfa4wmigwXiEIGuGRpu48hzUK0uS84O8YR
         AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662647; x=1793267447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIyl06xvEjbmEgUN6wCq6Gvrcm2kmVA6lr/5VlMLNgI=;
        b=xaCaS080HrpGBmLy018KTyxK9G8xeF4BB1Sv2yWAufdhOd73S7CisdLsFspo9rN5h6
         PM96SwVaBXfoM/0aRFvf+m6iaoF+FFmTOYwDj+1yaQ+RPe6eXpFysaSqmaK+r4RcWMgb
         zODfNV7WCQyXf2GWy0Nzb678Uyg66wqSBSY4aPiKg+jaNDzctwJynLnsadCAJOUu97nx
         HeKFuWy77I8TR20j5rJ0mUzvbRXwU3H3211nf9Yk1p6Ews2synbKXjvCblIqLFrMkDTx
         lcQtXXo2XZqJ26HeSXVsjEjHLt6ctd++cOdsphIey2ZDaFO8I0L9paUCoN6pwRvO98qX
         Oi+Q==
X-Gm-Message-State: AFq9FYIT0ooNVm3GbQdZgxQHcdyCoic7LdflydeaIbFlLikGw+yhCuFm
	hKBsR+CtRkerrYLuxPjRMdL4nO2rlz1rnsW0M0zmBVcRI7sQhrQbhDeasyJ/XyC7MYY+BdX0X2S
	72AwkvQDJfw+rNIvkGwMuwVmVChrhyAoJ8CogBx8qip2Rqr1m7m41WVoRys/+QNGgYHJX
X-Gm-Gg: AYBFou3eAwl3Y+bd6rXfRudr9h3m+ii2ExrKH2Xo+4dgVVCfXwns5sHl5V1OVxkXrJe
	wGTESkqVNZa0ZTuR5Mn0Lo8WfZX0H2NBN1MSqHc4jkgkgJKM+Aq2UPlCToVXtM1PryCdjgWKPDa
	+uJzKsZ2iviGv0YDsxUCW7AoYcHaMSofy7Q/WnTaZSx0iIu0axRRFNjwREyx5ixxzUktzkx11Bx
	fvbtPbTnPF9Tvso5HXY0UapdnVYmUj5sh6pULNfyAaz7+2qVmiBBhchcjKehVxqAnwHiFMV/4ok
	UQjNpC0T79lOYcHY6J1NcL56hdHxx7/JtFV2RMKl0VI4CciPKuLwaCW3HN1Bk5XTesusXsdMfqO
	zjDWWB9Ydc9hCDJtoH6MOUY06L9nCkESEr+U=
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099378eec.39.1792662646502;
        Thu, 22 Oct 2026 02:50:46 -0700 (PDT)
X-Received: by 2002:a05:7300:ce09:b0:360:b8b4:840a with SMTP id 5a478bee46e88-3674f11d98amr6099342eec.39.1792662645949;
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:45 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:46 +0530
Subject: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
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
Message-Id: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=751;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=Tc936ZVNQW6mLGok/m6D1h1BrwXL3txIdA0BfJ6MmDE=;
 b=1GX4UVZNZHB9/gF9/n5KSTlC09POzm0NxrliBtqGTowzVdhcXY/VFZU0aheyhoGUqqeHZyzda
 a+/S5i3EghQBBHopSjP5F3CPKPw0q1SJq0X34AvkUNV9NbMsgxJSAyn
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX2VKl8jqL/lvO
 k6lAUG3EQjhD+Bwy2gKYAwwxPfXo0jQZ8Tpjp28Jv0At/YZflXUHAB3Hek/onwGUp0lK3AJIM/K
 5/YVNJCYJW3wjx9zBiGuOH33YsnLSiIPztmVRg+n59u5Xo6+E3kfzvaX0dVYqjqAnAF2LoeFSuX
 /MUVDkjddf15q8ZbmIwaSQaAz6nxXVE0nnMaNA0Whm9jeqIK20zsm59XieAbDknkKdKe5PXQSuz
 65/W2qxvDjkXyNFbS5Ymy145+TKwBWv5B1oeLAEACEYiFh+HXTWvkOIKnOGneS8JSST4EDHMw1T
 nqr0qiJYOaj1mCW/CTfTDb09Ca71+bld70JHQWHnFJ1+4J+LUxmX4MvkpBR7wG+pHvJWY3HalhD
 uX2xwl3SB1wyavietUDOLemLVF0HVOlgroGF7iwarrjKVlGKkk2oKwnzCIfSQTczLETd+P3iMY+
 hxCfNd6C4Z4hDnoPhlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX4oYefyQlpKoE
 RVwBK0VM+yZafp0qUDPTW4YkkMeF1JvadPOLRbq8RKwwRkRUjSpkh+mXE12YkS8YgMxCLLk4fB3
 ek+CHYTyuBM34ANJoZfsZPNb5wt6yuM=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9dc77 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 4U50CY59ivhQ8mKPIC-aiEvXcYGE5t3V
X-Proofpoint-ORIG-GUID: 4U50CY59ivhQ8mKPIC-aiEvXcYGE5t3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220039

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 22eeacd7aecd..bcfd9e942eaa 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,6 +976,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l1d_1p2>;
 	status = "okay";

-- 
2.34.1

