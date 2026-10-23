Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746206;
	b=xR45qYCXbqRj1wH2EXrm89aBua+jXFE2krWYfe4G0f82fGIe+/csN42BeyTdILPnyDA4
	 eHIsUGk6DXwEON6hWfm3icM3q/SZ43fBfdWK19eWCxif1jglWhE6pOGGwPqBg2wdkz7sR
	 L9N2TvZvcuIENhc5b5/wDCdEXWKYjKpBnS+MhskjOcNq6SqUXwYahuqWhsNU5RqRL3/wv
	 Ddw4aZkitbnc7kxbHZk2hO6lyeeOMKf5PxfoJtaE1RVSUVlewMKNKJ2twheipeHeEzI2V
	 S7/GA50MVNDH1v+//UR6fx0cEC5r/NQOJ6W5zw665mod8vowMqNJrH55WrCB9sPVCjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
	b=4qESpro/vZ7Ug09IIcGLpsTpshVqj+ngwYiwLn6fVPEAI//znLLOpghuaLElB2TbOTaH
	 mhzNQ4nIPZD3tHY9uSD25HFnvyFL+Qtb5vIUGspqUi9IxXWEhhqY0kPA0yA9CukELGcYE
	 Mr3R76cIS8QNZpngiKHXX4wLqnd6QPhSrHVHN/9nBGHoEBBMh9ERW3jVC8hsaukWZflJf
	 VSBQZ3ZGhFSqXZOX5l67519F2Z7TEf14STmjTz1B3V9LsPJXt6eyrad4OBHbhJz0Zh4iv
	 uJXmRRjupKY/GVYZF5/MxPjd6pAQ0/M8NeWNRapt4mki220Oor1iioFeKgLCysFGD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlGnRFrq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRa+RmDR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A317606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A317606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SlGnRFrq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRa+RmDR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDIu2092868
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+q1eV+ucE2e
	Co/QY19WIgE28IiM00UBzaKhHu6xsTrE=; b=SlGnRFrqga1sYpOmb5seGpqnHXA
	lMVCsGwtF7E4P+qtUnTF4k+SVec0V+ocmiJO6IjCO61vOGOwBxaratwVbioz6qjZ
	bQGqVW0h0u9FFAPy1p1Oaovg3IFu96kG7hH+aST3C8rUoIKMR9LPkv3gHu8RTNSl
	/pBh6DZ9Wa+wnHTc6dvi9E5dxe3p0tp1evpskV7U6NzXDD3HEqCt31KCG2QbaNqe
	vC6SxfajvbTD/XK6ZkVNhaJ38gmVTiQQGh02anQwIO0byCmhbkAbYFxkp78g9eEZ
	cHw/fek4fN4hO10DnSUQaidXe1rOBSYh/rufLnMoDAzVD0QY38qDs0zrNAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyga2q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:03:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8ba4757baso6486485ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746203; x=1793351003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
        b=QRa+RmDRJUJ5mcV5fq/2UD/vP7mk1w+/EM7x/Z2F0Xo5ZiyfwuBMJoTuuc0aebc7MP
         9e+SiJ6OVJPDdGVahn0GY8tAJzW+7AalwedaiJhKicvvO3ztVIaE5CtroVhv8rC9ew+A
         nva/7/wuumKUDgil5RFW+zKfUgRelBL1SAqMNouTmupc5pldOf1rfP1m5aJs29mok8Jk
         +s+XByF8KNB+D+zFdLAV80tloxy6NXCduwrUyJoDhGBB/TKLCI5ugG1oZOTm82bedmD+
         pbqFfehqFBnPR1DP+rh+KqgMDlMXkWkFX5E9KcxiPs8UkTzU0ElFW3F3iKosEQuq4ZtK
         d4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746203; x=1793351003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q1eV+ucE2eCo/QY19WIgE28IiM00UBzaKhHu6xsTrE=;
        b=t2L7A6xpdHqrVojvsb0G8h42oVEBvGgVy0QTwJ5SBZt19P0JTznoRwlzdK/M35b/kV
         OyhHqp/l3Ih7GqM91ixm3vcckVOz7NZiMEOWYszhisve4A2jyT/Udwb75T4aO+m1+Sbl
         M2BmH/Quzxe7jnNktV+thaT9x5sTk7tXnZgS0v3DBP2/wnjMfkhXIEE6pUEjTITCtL8S
         7mZSSRB6jU80PqpADklzh0BPbVBPLMxNFTMK6r8SinE0jY5SV7qIyu/f7hMeLtExPM5r
         1QRQ26tZlm50rnWuLflr+3jT1lAuXeo3USlYilxCIle8J05Zoq2e7P7Gfay+9e+1F0d4
         Dxyg==
X-Forwarded-Encrypted: i=1; AKwUvBzgOVxLBXiZMKao/7xpGXeFWEdd6LV0AJjsrOS48D6PBpvXUdQe18dNJ9J96LPsY7erJIahK5ao3nK6L8Wd@vger.kernel.org
X-Gm-Message-State: AFq9FYIvdSGbcz/b4tZNNy/wGvdajNJMwMj/79z4uSR+p1BIZGURIFcf
	Tb0Lnt9spJqjIRvjNUDTRE75rBFjUOx6Bk6/EufWNfYTSht3DNJffQp/dHgOds/QE6kCj/E211E
	UPQDmd4okKc0T9xMiWofzcYXv57NnpAqw+Lr2rDQt/IX24hDKlzQHHfe5lAzl5rEwvB9i
X-Gm-Gg: AYBFou2CxIt84VNSk8aYU7KzUHYrmsKkXMAzKQqWgjiHfZgeFnMGgpOilcm4MZNSWSN
	5Kv1lDKVQLoxFzB/ggu+vXYYneObe8eDLNM3ayGMIKobyrlOte/7Dw26YCMjBDYBE1emB78/PgL
	5D2x+xhLZ5LaUo6F23XfPkfxvzbfulShMBsVla51/A+LS+Q8H1UuMDAcgd/0n/HFWOmV9MbIldk
	5ot1FPKL6Ag2XOGY7w6M4A/mJundO/LMDAHhz/jf2FJ4hr4dn6bEGflJmpvSEa2qiQALzVvmFpn
	hbQJFvQZW1l/TOb3MfqOwdHeYVGoYjKyfLi7wZ4JQavDp7iCAixexuric4RJ6IV0TM1kwWh5VwJ
	PegsbCqsrT4gaeuFOfrQiRokToUBYDo1qzQ==
X-Received: by 2002:a17:90b:3b4b:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adce74cd8dmr1384918a91.37.1792746202944;
        Fri, 23 Oct 2026 02:03:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4b:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adce74cd8dmr1384892a91.37.1792746202282;
        Fri, 23 Oct 2026 02:03:22 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:21 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:03 +0530
Message-Id: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb22db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OoeahSk16-wZEypY81EA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXzVlNex05pjxJ
 5DjZ01RbJnWPfqrWNag/a5gAf5fjoapZcoGPHhEneRJNptPhNLQQ6q8pvIpR18nk5uABulEOVZM
 899RYWHcWv2HTZ9UpHwc07G3PQ/0Jjk=
X-Proofpoint-GUID: gd07Cll9j2fb1S4cMpfCRrWrfO4WMrz_
X-Proofpoint-ORIG-GUID: gd07Cll9j2fb1S4cMpfCRrWrfO4WMrz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX3CJBDXzzIHhh
 gYQapl9gf2dgVAxnOGb9t4754m7bvkm+BGGyRmT+aYqMyfPwW494ZyyLGj216o0KuvBHl2KuLwZ
 32sFAVkgoPlhBF1OSCsQsraf9tueTBp/1ZGb06XlmG+bxM2YARoxE8vQKAP7qFX+jlR/p2ktbW2
 Xmz6u5vLWkuU94F1f9+OB4sPl2sknJE5pFTujzZGKwb9R79OTKHK73g1kEUkXmT9DMNVV/P+NDG
 xKWZCBb9u1wHDUc2FZZa8Zze45Nng5UNCWB8Gz7j71V3081PZtuZiiRmZ968PW0Z2GQECtGx95L
 tzt+M4cSzV3S/SnKDKA4c5RyHFVmBkaKhh3Xo1fdcbSo8+BdkRSZO/Xs5Nd7R+SaEZuyzFPetqI
 P0QyDGUsIwmLFyXFI3YtXbshoFqp2GhMwSKpPWrCQFPcADn8JfUbcdPG9JMhPMUPZkrDCANGiih
 cUx+6UY5U/Ao3dBE60g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from Lemans device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..5481dfb73454 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7861,14 +7861,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2149 0x04a0>,
-							 <&apps_smmu 0x2189 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
@@ -8000,14 +7992,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2949 0x04a0>,
-							 <&apps_smmu 0x2989 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
-- 
2.34.1

