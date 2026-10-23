Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746226;
	b=vDAW3GJVB303V+39h9o6h5QFL6SzDYz6UHUBOrn3ICaG0wEslP+067jrPetpzRM90lrA
	 LUOC4IeKrA7UCTM5Pc6hmILV02JHGQz4Jblr0UBGNO3qAjdLxWz3Ys7hcGyafUtpxMFuz
	 0yPsxBxVmEIk5Ww1cYERvaAnuSEba9c3Yd9wiU+DPe1WwigbaAPG7SQSSqvrQoFCFWsGd
	 1vV8PE5QDU56wtRaqvN/yikpuuCjVFZF7wudZeKs+jNQ9ovIQm4XViS26BL1p+T3h3YOK
	 kTbV8mfkfISSOKz4kVYzR5bC02j6kEgVLVBQc5uJdUvLuS4VL7yWMuuTOSI0ytszLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
	b=g+t2wdaYjlMTIWorVHrkRxD3hVAWslv6YpLuLf85Vx16XTJSW5Cji0/0zovxeJQSpA0K
	 iufeI9nY0ygBep72U/I59cjA/DJ8TbjGWFN+2Lmdk0Wg5FLuHZ57gKcw/y2NO+BUBm7t6
	 mn8OhlJPp6k0ifmEWKesLc7vqUACvMUcu3JR86AqYkSkjHNHxxvpCeRtjmTkXBx7QVJSf
	 IP11xV+yqdwA2TbKyq2LYlCfeGRl2ij3fmGl+yN4ubBVndR1oCMR2cc4gr2fOoATOOmrV
	 8eN55GJELANkfHVvnm04xv5kR7VcdjTQ70PcTrBRUWHeLyCI2BXBRYZnBgyQHiSQ0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp2rz4zD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Clb+co5X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FF606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52FF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jp2rz4zD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Clb+co5X
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F9wi2112120
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NpvUnsLAKwd
	/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=; b=jp2rz4zD7ONXgwQ4HAdOHz0I/UU
	XP7XVbP1vv1aZ/jk9kPG2LRl2DOtEHvLzxCS1U0Q6CAxyZ2dXt5vZ2eIzP9u4Igp
	fd3rPPbUmmeGJSUBSGomYy60LMt4x92hwgklMnojYjrHHpVkqZ8JHEyls3SZ0DMH
	FO5p160zcqI057JZbOpt3DtJ/u5e+uDl4acJjieg/4h4XNfeGQb2wSMxCXkDhnUH
	b2Ru27Hy3Zmx+kWZbWRTti5Of8UZzxtNykBW2HgBgzlBjFyi5xNGZGti3YLE692W
	WMkwrqe/PMN7d1WKcen3a85hUI7CPlYxoot3Iu1I3q2I7DLIes4EV3Ho7sA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykaa6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60a365440so460376a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746224; x=1793351024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
        b=Clb+co5XQeyLSh+7K3BbZ7x7MDX8+PtdjrZWVbDyFnY4wOvhHY+UOmtexx3js7KO4W
         Qhe+LlDTj/Ocq3g9DexsZisqtxhM+pAm/VTO28cGJpVec9t4+ctzQ0j6h39KhBj1I/Fy
         lhOtaUdYDujJ3X/j0woenqMc0fN9Sw+W6cI7uOqgYHeqbSeU+koGgqPkiK+UzkrE8916
         2cUUid4tMMZaqPQkptcoXSrwg1AzsWn+qoIYK7rU4sMo03AQq3XkmAfa2ynUl0xVGOn1
         mVKsoezOLta4PizO8FAqvbkljG3sbp3b3yVmkvcLOmB4i9AN3HR2uyUg2UHoMY7cflnE
         qJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746224; x=1793351024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpvUnsLAKwd/VAqUA+EeIsjP7hKPCef0EJB8HBsJ+lw=;
        b=Tw9nbsGZTcImk6Atxpiu85Um41OBL3sCxuTIWt747JsKbJ7aXF95WFr4mTMzTH2QTF
         6/Tacpa6DIs6x+hkwDvafZAg/U2SJSXHZmiG8BVp1RKU++3KQhJHpypVxcQZzmdqZWga
         YpQ5I3uiajYmNx5qkMDguFwpWHVoXGe97o22IfOzjyUn5ze903TIyYhs+SFYLrRnqexd
         J9I5bcqcuKKSICWxElYmibQ8ZX8pz/cIQSBXQ77eN4tecdtVAXyjVsyi466OozaX0fBS
         2KqRSoQIsJCdQ5b4xxcrgI6x9fmdWxTr2nkYHD3JsiEvmTcaCz/VMQH0A1iiO5yEqrxe
         XDvg==
X-Forwarded-Encrypted: i=1; AKwUvBxutWAjoSkVPrGF5OIP6iNm/jYHBp1SRWwI03T8Tpot+3LHQxOXy4QVB1Ee1btF74dL2li3aH4itIWG7MNC@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ttstvkpMJ7bOTVEe417n5ecliBZ0bYgXvl0RzQ+/ekLdF1x/
	pFVSNnyqiCOouqxzfmC7D24Vh1Bb00yniIStc77HxTVAZw5N4QCtoEj38tLiOyNCpyqUE3DZlsc
	KC/sav20GjwDydS9bfMrW2SWEQ5HXlXjPsIRjBnrf6ak72NXNHhtF2kyNDbJpaUkVclc8
X-Gm-Gg: AYBFou2X7HVc+7hZRQWWwMUnsOEHyw2r7X+pSSjPtRvcfPn3P5NInDPOniW3sNt4aMR
	5d7UDUsTUVVEkgEJZMpMyA/hXVKa0DOj9PmMrYVZks1YvtoTNCpPAZjZ0iliLpG638hThP4Yo98
	aTJlpqKSrE9ueLS7FHVdh9awRCakVRBkFEnEFxn3/q/RNllPbIPy2hU/4a9huIve0wMkmeNZx72
	y/cSZCS+VfPVfdITDv378WGJmP/mvvMmbN/isdsFRZHu+ftaOQD2ar4BPWz7QgWVv8gAnFA21C1
	nX5jCDlAhTfZU+dS7JOlSfcwMuGgM/MNnyIItFvD8CDuvijC8AK6LFWPeWf/Hq4vWHJWWgpEz2n
	qGSCUAKDtzdIy9TJ/wXWGWDsvYxOcYjBwIw==
X-Received: by 2002:a05:6a21:4989:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e376748cd0mr1004538637.81.1792746224476;
        Fri, 23 Oct 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:4989:b0:3e0:dc12:8908 with SMTP id adf61e73a8af0-3e376748cd0mr1004523637.81.1792746223965;
        Fri, 23 Oct 2026 02:03:43 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:43 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:07 +0530
Message-Id: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX2WaCjg2y6JVb
 1DKTkJjHnjyHEmPzy5nL56gAt5n7gkq4J+it5szYc3eMS2n4tkJRpXMbWGgxfqUp+qRvDMTQxT9
 AoMT5nUrBBMFsUsShxKJuJEUKhI/GFSyLEq0t5SNQ3Ct8UL2HI9+hwJHVkIr5BLAINFtNhDsoX/
 y1sh9ZGlm0K+xVlLan0vMkgwVMpyliCpw6q0Yn5UGetXqsJocolHbPMpqXruDm2MEBuNeZrO3x8
 znlCaxJ6vdXSHUAb5DJogqfFoHfN6HWXptsgnS0YRSBM5G84INdG8TirdM8HLqPSDDpu3ktTygM
 ZNhYPFkeASKjbd/flGWqnUIOK7OP07QPUoiY91Fu5TqVHpYmkNk+ZMewvlWhp1urwaU4/CxQNXu
 5LGcQwvPwbx8Pe9mm3jSVXBBAKOUGjfIe1JMA1RVfAZfsnCkHdVJ8kDs24OgW5Ac+q95Ka86WM/
 b/EzDQS9hBcR2IjdlrQ==
X-Proofpoint-ORIG-GUID: cQMWthvX32OLsXn3Rt-6RHJE3UVTW_Wv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX7A3jngh1aLDY
 gubCa+Ea1cnnjpUP4Ms9671/GR5zG6IHeFyRw3ikU48hrIv4LpvkHvqU6pgtc3CfSnAK2r3+3ab
 iunDYsjx+OBRD77etwwAttRYBI22WqQ=
X-Proofpoint-GUID: cQMWthvX32OLsXn3Rt-6RHJE3UVTW_Wv
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb22f1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E36itTYgs6eEPh_MiKgA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from sdm630 device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a41ba0da380b..721885455639 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2483,11 +2483,6 @@ compute-cb@8 {
 						iommus = <&lpass_smmu 8>;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&lpass_smmu 9>;
-					};
 				};
 			};
 		};
-- 
2.34.1

