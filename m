Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746220;
	b=XGmuEfTk8bEN5gxiIyr0d/TdxEbUXcl+hYYJUTyowkxnDoqB6qJWlG+ZVgLUtfsncPxc
	 SeaDbas3PudBXsutfihVjWQw/yFoJUYwvr1oEHH0mg6PBPulzKj72GhHDEUid95xZjOsi
	 PuaQYRT/RnXAURc4xQpnZ5UGUdKB7Lb2gFZLB4F+LbKi2A6jyk2HQC6wr2DbaFOwc4MVA
	 /eR0hhFduzAIf51BBnAii0fOezi4yO/Jn0CqTWAJXLfxG74UnrJT7oqjg84IAWSJM40EY
	 t+A1oL43KwpIxCNQcX2JukTgC6nceh1CnQLW3RVrT0QfddBlVgKyRWDY692YQbxh3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
	b=F5eU4fvI3ru9+xmY0ueztoviPq1qVxQA0WbBDm/Kzn5W1oUFp0obLfDxsS0txKHRC7RJ
	 5YHPbmNxIVG/9TZysM5djabvynFrmPS44sM9Tmmw3a3+wv9ZFQm/TPzidq/9K/rQLtgZ3
	 ZbMwvROkTDGj6Yf9wCSSmiaAiMe7tjY5AurUEcGuHU3VG6uUUe+Gc0zkw93Mg4tHEL2+A
	 YCiQh9CisqjHB6W3c33cORyGnyeRTuWM2q6SQzsNwryaL4s34ld1GvuuMLv4SweFTrl9b
	 wuZuVWqu2pdR5gsI0HAcyBW03R/HjTHly2rFXP7NESErtXQ/dQYbawrUXAf1BHvqZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEwgp8Dr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kxydvJHS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B060A260F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D02B060A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEwgp8Dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kxydvJHS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FM3I2572492
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A+8sjnjyCG/
	D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=; b=eEwgp8Drg+K8WQqaGVgHPFoYH7m
	ZelowxguDuOG10m6kMBEkuwf1fTuo3DJ2HCfMaWYxJzvm3fs3BpIvTHw8w91OAyZ
	CHS5i7cuf6KUCmEB3uwdR7N+xei4rlA8Qx1nTZwb0gPsDzNj+QqbBnaH1lyl/8xD
	44M5sbQN4LSSU818uZPd1ciynhIcNw1tF6caBwXgA09/zxJaeoNIgZ2OlUoQH/oy
	zQBLxsc+d8O0OR/0Pp5EJl34TrOC8kTcmYk9VUZ3X92cgx8uWexF/WFpZTPRstZC
	NYonkur4H1s3tMnmGOXxnXFiA3zArRbcnX56HyJ8jdp7Vj3hNoU4e/FVO8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0kdaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd66551e02cso762866a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746218; x=1793351018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
        b=kxydvJHS7jhtpcpH6LlHPMKpiXdUMo0oTBQb39UC1QgBFw1udHYcrBlQvLDPeojt7X
         2WqHZv+HVifMAlwFOPF2rRHeC9+eypn+pzAwpxgIeTviAJ66qQVIGOYoKnW79D2noDK7
         KqL5Sj0jr+9C2Zg5GI2kEw3BM2pu3ffuGya0ZlvRjy45DYPivszL2qOGaB8k2jqXID6F
         quNK91mk6dr4Huuy4VtSbbgcxjRu2GqvcLOW2PW7PJhAp1fEsh++50mlxGAVSDNRaHC/
         ip3RQLklvbzSjCnxTk6W/Wncr8QBro34n6Ynwjum4TtY9KLZVBtwl5AB+Zgu9u64NcnQ
         8jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746218; x=1793351018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+8sjnjyCG/D5KCtBy1/qNiT6sKxNkDnINIvcENVECE=;
        b=LWNEy/HYIbPb55GLC87fKaEbmGG+G36ErMDfQ6LDQu7BniqC3iGw2jblhHruyM6EeK
         PXKwtKR941q6dGLTwkYv5BLb75s52o2zIy8/ReD9egm+Mc5Z6/fIL+wIxMT5RYdPjhtO
         ilEBffwMv9/oN1RIqvCKLUA+dYs1Z7sBH1BoiMSSKSnK7LsTOlJrI5/CJ7u+eGbHI/AY
         f1eIv627mPr/VhlYlbAA3+ENkOCxWUvnjWvGoXrytciZ31AbDjeVQN/Syp6e5DwRvNOJ
         isudH3KDaxESAdnw4QXAmrlSIFWeO9cU8ESFCOm9odrhqGLHfL2SOWix0Pksc1u3xsOe
         oNjA==
X-Forwarded-Encrypted: i=1; AKwUvBw3nrXD+FUcEItEEKWz0LgHU+M+CAB1ODG9H9bUSVVMxjfjTMSsklY5uZ7x5tF2Gn56hD1N9wAFKCXvAG/p@vger.kernel.org
X-Gm-Message-State: AFq9FYLXZjAM1tYO5iltau7SzjWH90EpwE1Y7CQ+JJmmBBmpMBeqB74K
	o31O53N5JVpSz4NMyOZS5rkBci6U+f3I7/8EMGlPpVxLdJLADZl021DRPFA5p/Rn+OMf7pUIfUH
	gbk3R7oq/T4tr3RaylW9JKQrV2839ukSKD2DQN6vg8mwLsLBpzM1oacsP7R8egA01YmEY
X-Gm-Gg: AYBFou123v9uM7k7f8egrBmgGkJixGLL5kVMFEB0LveVL4xNHGaYxHhhqXNGz50BW0T
	t6AsI8mY+szwcv44L2JFQAOnbiIP0ZaqMyqW0D/SjUqty/CZV2bpwgsJWVY+/qWsm+01s6ILVu5
	ZhIK/mOGpiNIVl6Iq8Y6SyvhPpb3ASqhPMnuTfs2f8hgIUq7H2FHlAqDZFox2OwJaHzAlYgDwCx
	kGT9gd+DSDtcHVheUA2jwdugbg4f6g5Wx6QFcjwc/ksLYYoVDQkFKdfa7C9cBwNi2MutDZliXim
	xsungwHBtKldUPCSkYiO8xgr41P6TpjBEWMqYm3YJL2IAfPxpNJxfcVH9x2P1JYevSTtqRrCCTx
	9Kyi7qGLokKTvrWJpeoPEsS5uNnMoTcrHcg==
X-Received: by 2002:a05:6a20:a11a:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e3692274c5mr1250205637.25.1792746217654;
        Fri, 23 Oct 2026 02:03:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11a:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e3692274c5mr1250183637.25.1792746217241;
        Fri, 23 Oct 2026 02:03:37 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:36 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:06 +0530
Message-Id: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: joXRshk9h4xptVwXE3_b9FpQ_qXvHXTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX8JZ+caQWvexu
 DliN/qKXAzPyuVYWF5K6irplsJMvbfrgW8sFR5qWqT2UemnT+7Sv5hgNdMkAvlpb9tIBaL2cUly
 /BiSVWLRy6ZgWKQRj5WnN5QLWmghD9sxNyIb5wXGUvmD41S5O0qEvTnmLyLh6aiDRkru76d9OQy
 YDfj68tXLwUgWAz2crhNjsRXU4OOY249UJ4jWQjsR3D/9emN/wkyFarMsyvPiQkQPSEp/6pY3Dk
 zRcjSU0K8LGS9yJ3sO2fKWfUu8RwpDh36ncJT0rl2khJPmiXSb3TWi/rxEfL5y/lj3OcFrutjJL
 bhep0xAGOhd3mMY0IYeJ1acqFuvadApQygjmw73+zJHVsxPqC8xiQu981o6BfCoPhZVcjs+ig24
 +tWbWqeoTHpVUbeUnAWpRFGsNx38XPN+QuWfKmIistQwrRMJLl5yNslH06Lwrms/fdvqoZ1iTmG
 JTph3gBhKz9NbzciaDQ==
X-Proofpoint-GUID: joXRshk9h4xptVwXE3_b9FpQ_qXvHXTr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXwvKw/VpRjByV
 XsnV3XA7IGCgr9XYr4TWLJTkcbl3QtnFS9QrQFOioNH67V86cFRfVC2VernWWUadOvJI4fgUw1r
 hIXDKpDMH1yODKn89kOpl1L0u4dLJPY=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb22ea cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Bp0rkiFJIKxNgHgNeN4A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from sdm660 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 0fca9662c64a..723bffc99b67 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -386,12 +386,6 @@ compute-cb@8 {
 					iommus = <&cdsp_smmu 8>;
 				};
 
-				compute-cb@9 {
-					compatible = "qcom,fastrpc-compute-cb";
-					reg = <9>;
-					iommus = <&cdsp_smmu 9>;
-				};
-
 				compute-cb@10 {
 					compatible = "qcom,fastrpc-compute-cb";
 					reg = <10>;
-- 
2.34.1

