Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718309;
	b=mDoEbnl9HxOIaL5oScWLM3VgrpWEkaQZVo77RiRviFkuLTMdZQpfgxJkACVPhtI8qjqH
	 QdXRHP4SGFYF5f4QJ4R/u/jRny/IXg4rLdFmcVJkozndJz8c72e2OqzxbAV5OliQac9Tj
	 VQJVTt9b6x6rmOMuK/dibdV0U3pgT8li4o93rVbkra1ZD4nq+K7BPq/wykcf9ISXBFSn6
	 V0tSQdCpzap+XqYNfXmmiPcpKn0l/5/H2xcmQNtIdy63TyHCnJUrrHSlnWHt/T6gbWj14
	 BPhWxByQ/3uXkLP34dt88BUjknT1kpZCJlAJM36skvKK7pa/1Vn4rCFR0THexrvx2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
	b=qqsQo8fUqKII+ZKxN5cc/fwm7/qP1HiNrYDiM7anBEI7oe/z7kxcR78GcHxQjSy6QDAv
	 diXPSrC0Al1AHg8+V6AEmwBVitg9cbLn2KRfwehmC8VS+t7SoQBrEvwF4oe+bFu4DITjP
	 n7ZszTx0c2pUMpe0jawKS6/gA6YPCA1t3wOymJYSLKWlUI/6Octn9zELrNWOF9ounZyGY
	 8wHQQwte8h+NKkdG3la0TJsWOqbfwkAUOYbYhv0D1OGOyvgs3XYG4A0eKDRUsreQ0sQlN
	 /F8KGJ/MyUUCQ24M9JCk829VCapvi9qd7oJvII83UW4BS84O5+aXmLYlaHn9e98akLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F760A2624
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56F760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQH3JNU3470978
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4cGi2mqS1eP
	+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=; b=kuKqrbZPirNfBCfa3QKN6gTP4op
	6Zxyk82dv5sDJdlZuOh4mP2Wg1EwwkQ1J6in2wE5fVMaAJM5wbBtVnk1t4cZ6PVv
	d+nczlGzEUj+FG8zV2GKyS7RxlT5VOPt/ZVPxRdAIpwA8YVVbetWJ3Aa/Me2EumR
	/bKRdt2ZtcgKb+YMYX3KqQ21b3nxG7NjY7c/psBtz1kYe/UJF9+du8AND6yorb99
	Cyr922awU32Xy3jVCI1LDOqNU72RlfIzCzZazFgLoMTUxV6FNFVRpdWHaob1Bf0H
	qh7MT9GSsgJmFfSxFSiD+x2pSPYxg8tnj668KIEaqfEmxb9PCudep1cd9iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru387u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so589101585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718307; x=1796323107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=RCIPHABeYjvdTYSx+RUvTx/9Xn/zZnbpDUQHo+qhN+Z+TPuS21OX0nj9djx3JDYWOd
         RpU+GLjSaLLLWRbFHM4oVVl1xx90hsBfc7MX35YSE98vYHrhHGHl7nHTJaJblUUXdvk4
         QkbNTtnFa2wtKZ8Zgi9APjzn6TJZ9O1HFluglv2/BuPyfi6xU0NLealpjDCBWHiTC4iV
         o3Cngm2v9xUQujTQZYk6wO6M0tfYm0ywsVLcg7jCc4tTZqtkceJzc5hsKA2Xh56ZpSA1
         UcZcS5O3sZ1nWK4HylgR/TU5AQ1jSHtT1Jt41C/sF0r+t89u9ri+bGqsmlZxnwKkjIZC
         EMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718307; x=1796323107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=1vvWbZhsYeQ2cn0WdAiWufOmfbVssdrFu8JpW2uSHP46TaTifnIq1K01EhZgEr2auC
         jpOTw/cPqvhtJbV3QQFmzLfDXdK6XAhzKL4HrpEM0V0ha2UzGz27Q/BTxW3VTSvc1r3b
         G1Oobsn/lB1wGEM3ChkNNmPQ03L2VRn0HGWswkin0POd9Jjq7maKxFqeByMIX+t/vhXY
         mG7VlCUXj+hu0bvduu8CVKPyKC9UhvsiVBu4Z2lS7qV3KQ+05JFMQEXuv5rMppmMNJYg
         SCjHWYSz4tDuSKcWlgpSml9zvytDYFxKia3FUbB/8rBTr+npJQ5whLp40p9cx76LCoFp
         Illw==
X-Gm-Message-State: APuU4Z/5GMfoxUZOhfxMfM+WEgmMZfI/DIak+AJnKvOUAIENxksStyMr
	dQmMOrTEBm0PX+8HHhMr/jKuW4O94EG7d5cpnFvqjpRWQuWu8qN84YrdNbPuY2snAlhZpPJx7v/
	L+cKFgxcjs+bkLFn3ltumLmuxFYYJWbLAJwk8sntZzgpK8nJI17K+A4fe1XujQ9uTC5vA
X-Gm-Gg: AZFdTZdh3SNxus2oCrYtbGfy34E4uIXFoI0Tv1AmxskSgR4WVdjtDsxgI4ES57T2Y2z
	9RmY7JsEPhNDrpmss8cj51Asi/l1RkxFr3qhAP8So5u0280wZnkmxgUD2wvB0u2raZF2qOVAkgP
	xyJ0gWQlDYnpmUIcoKf34ehEPfDIznZtyy+gdWCQRBsK5bbTQVET2EMg7oR8dL1ZwipKLnqL5Zw
	OR1Dmt8Dh5/lQSS6Iw7ohZeMN6fJ1DAcA6VcZKmILkYLjn61Sot4dtucn+a6rDb3NgEniBlD9LK
	TopD/s4zxS+U6czAH2m+M3GHC5A9bDmYOtYSIRMXtSYSbIu6Fpy3PSXd7fXXik0dSnuEOIT0RMP
	gy32JVBMCxdbiEVuSkxSnAzynBJBH73ZQVJKfympGRaUGOzTD4yreRLw5xKDByK6x
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793963285a.73.1795718307193;
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793959185a.73.1795718306758;
        Thu, 26 Nov 2026 10:38:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:05 +0000
Message-ID: <20261126183806.172485-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b087ca4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5gig-nNO6tgeK3CUghP1wc3zdXhR_-6S
X-Proofpoint-ORIG-GUID: 5gig-nNO6tgeK3CUghP1wc3zdXhR_-6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX5DkecwHpJHKU
 EIAPrB0d6sqdQtMEZTrUJXef266u4Irn4NOC1NESRVCNmWdJtDiWBo6AGv9bE2TnC0WcdxRUaQw
 tkUlkWsG+Sgg9Iq04mZZo251tTsnKlR3j89nmXVfacbHD+d3zdXgVZGqgaChc549ulrSHUyfW2Q
 Vtz9xetaFfGL0vpQhEHTzboicwon0CluOfaGI/uxN1L/CepRvuyRUuajcxotJv4vDreeckjGZLt
 TdnSfGfThe5VWJFO49Owvls2uO/1Qszx1sMqMuDsPWJrKCjw3XJfiv9xGIH+UGL7BFaUT1Se4pY
 5AU/cJM4VyNzRBugeh4ZdDccBhVhkyOOkuyssVpyN/VVvxVDSoN3WB4EL8TU1XEDsVN1/R7gt39
 VyUx0xFop3iXrikdZ2ym7mO6gYkjfylRgkZ6pxGYyNkleLoJb/4XOiB3ijmTuTxrmibX0u9LKfR
 i8oa0uMISqD3BQNyKjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX1NK/60uUcEHd
 0w1MHGj/R5iBcmTJx2OLY945/I8yuExoeQI4snn/PLxy5Ah894ytpGFKDdbgPW/FpTiwqX1ov70
 t14sYI4N5lGd4fSHkpBlqwMKekmGpQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index ca035f10dc6c..70efda9ba2b2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

