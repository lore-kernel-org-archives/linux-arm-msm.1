Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719589;
	b=cO8JwBqCo5oFIU5Uo3c4mPzWqViu0V+WZzmHaQyINmnFcKenbsNo8VuIENhf8ScLbYgV
	 5O4ge9YaYyWJkTta1/KIo+xAGkI5msSBHk8ecdWd6foON5b45dodI8Lug3itVRht3hVga
	 K7zO9/XkEgBouq0eOwyvx5VxquJIrbLpNh3ksYBBEWmN5n+0MX0aULB1BYQWd1RZzfA5k
	 Lktyjwxd6X5twVr0HIIgVftSXl4/OvaKdlgHr+/9Cx5ah8JHWwwKIHmQjegVhnrU8uVFZ
	 PGjfWMvLbrftfShEys1byMYXOXvHCTZfdknTHMuGCFOLGUroHpOhHbuWCvbJs7/5oLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
	b=LgF97i7nD0dl9ep7Sbn+0FU8vOrSrxZNm1FakoBpFyXWu8ci60NCpF5shiOejNzSU446
	 TamgsX/0xRvqETPLZbFADFqBO1fHj95xQUz/b8OtC5GSujAB5zy1Mmh9i6osnRwR9AEAN
	 T1zZRCE1AHtT8X5MPwtpx01aJcRM63q8meZozQAU+tf7NhPTQ0d4I6FLzs+pljF1dUAKA
	 NGOG7e0QhyBnZxyMWay4bjSnaLhtyRYkaRssnuP1nqPgsoeKrUV8AcwvnIOGTYuBHZDeS
	 I/+WYErP9Bsa3xg7P2uNsb5/lRhFdfGjg3EXf1yTTp1s5k8aATdRAvozgjk5Ct3FkaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC8606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6AC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MK+PgnPw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+F22DCc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuCpk2068412
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=; b=MK+PgnPwU6+GUzoN
	AcnNkwEYSUDutNe+H0SmSllz4ZaJzG76xQSMz3DJsiuF5Jfn5ZV1xFW960GJHveo
	7YuUMcG77MbXc586q1hIhg0i0DMsie+u6dkAGWXMlhScwL9e8dsRGXyWlxUWuq9X
	pXn28xEzU1yOKA5VeCPVeAzls9p52Bf5ZO1vS2Venca/A8qLpmYdvsn5aG5W3VCZ
	FWve6x+qpHMQ0Zn1QNt0+p7GahqCyRTn5vawV9RQAuhkpQf4fbPko5k1PGiAm05U
	ao+IsY1fdtlnsB1urjM0aGrodwgNPrODwj91vto0rFXUSgNnCR+G7kP0VoPFy4wt
	jwNQ6A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y49ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b588e4bd7fso2388909c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719587; x=1796324387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=A+F22DCcF3PbLhvOQl/jCrD5J0quqQofaH6H20jW6qGF9+L4tArM1IgQwwT15qGDry
         JqQZkzMH8B2RiTp1cDzNuXW0zPrRChTvZOEWsojFqjdiWvbpnI6WodI9hBA78+gN0aNj
         Tm47UhuXnAX6hi+G12gXKSm157SJ93rXYmS38zBbI641ixxWRkrv2caAmrUqrLYLlLVi
         6nBscLxQHADWoQi4lLtkC4etbvLVVWnteDUQXzZrv3juDrnkqi6dFatpca6XjGEWa7fb
         OJBpTsuMjTU8Yj79/+4bCSba1x7zpt/dke9DlGyfu9RJGCpZSwzYnnaB7xoPRovA88Ft
         tMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719587; x=1796324387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhIc54J/K4e2MmEA6laRAf4VD5KH58JtaSUM84rvsJE=;
        b=S3hUkyh08lhJBYa1G7V3HkK8w305W9RIrWkjTydg5/rbTJazedTW4gMYn175MjZV8W
         ERez7utuqG6qpwVgLoW6lQ6f4p+ucitmQRNjm2QTDHVEOmuHU460MV9b/WSS4PEtT8l9
         4uAO/O5HBK3ls79G+OV7lXsUlEAgWLNP8UdzGnHrjn3/2HG4kdHjwjPNlWQT+w1LdzUA
         ttguuci8Q0sGJ+6fwgrKoNT5YMUSbBjiPynuFL/P7rZbx5Rt4KCSM6xtaMD1PXnHybuI
         CsogsJqUVqa4rTj4bgxFh287wMIiWQrT/nikBOzmOyM8nFDGky2X9rtnmBS66Q3gAGF3
         I7zQ==
X-Forwarded-Encrypted: i=1; AL+hErFiKejnKh1l8Shj1h+NgIjiHjR7djUGdUVsUja9CuHC5Tbtt+IsUdts+977GgdT/vYkb9Sg9tvyi7qKon/x@vger.kernel.org
X-Gm-Message-State: APuU4Z/QPMXIlcXon/Smdoxs2mtVwndCBpI9Zjf7AF+ClXcH+cKUttU+
	zdqhgN3G9nluqfWz57/niTwaaG+uQB52n2Flt8gpYipLpn+FHmLHswEC6GRwgZfIOy+2KDynKZb
	nbgJNdc+VxJntnXpv+5gwrGSysVYBFftJF8q+4VqkDUsnFCRGG5g5S/ettayt3bO3xR8H
X-Gm-Gg: AZFdTZc20j5r85aRGlv1NZGmo0GGDQ7u+2mU1/vZ5wbS7i35xfkLVSH9yPL8kRqrali
	EBn6ntRn9iJ1kFbG8SgMTisSyssKiBQd51LwJ+BSnb2ZSkJkvwX6XbXhCUQZ2RJRC+Nfsry7E/z
	kg7ZKF45pp0kYKejzbg+W3Pa5ZEOUcsKLdfWZEAggpUzRL7mhNppXc5iZGCh6sMHz7px0XUFHEq
	0tLtphKHZcD2ZNp2nQDfXAhjXNyzX+oZYrsAlHBHcEeYbdIfWW4qdPXa7DaP6+awVr/7J7J2kvi
	XjC3cSoIK+onOOiIx1fP2DRnLdwe2SytJ2EM7J2ArzzjN0GaDovM2mj1LAw2DDyIwZSUA1ECfwE
	vLeP0qn6nm3sNLoefmjQMtxcR3cRO18qR7HoBU6pYgvhB7lTlUwfN8+9u/TYOzrROX6jW0XG9EH
	QL5eDg
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29817016c88.38.1795719587123;
        Thu, 26 Nov 2026 10:59:47 -0800 (PST)
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr29816968c88.38.1795719586636;
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:46 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:09 +0530
Subject: [PATCH 1/8] clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled
 across suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-1-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX4v2mcJv2ouHb
 HfokJRpq4r7RFvSNqi5xVIPjsGfVzUDwnvreJyStpYKxtATwlwBZsGNmb2kqz+17K9TZM/xxgAS
 FUg4b0KO4WjnQfztDiyJbfyoo1qRsNA5CkiNYzVWDgVxgV1y5K9VvbGaiDAcGJoZOa7aJnEyGug
 KV/7+WJsFO5PS3KronxK49tMqHGsnjIQ54JtyERIzqnJYoPHG8BKQ9jX348yX+6ZZZsv6Vsj+GK
 rKIWe3zgNJLvet/6RpEi2+eHpkSiRgTnfTmPmJXv10fcbnPPZEV0bYRDvHlQgy/9ceahX6djzID
 A77iyHkbarA1zHu/qKXkiTBjVyoSx6EMfIiCueUgAogmkg5RRwP6+wf41s6smwRSIC0i25UKzsQ
 P5zCkuOxHxTCg7gaf0hz0yzrEboH7DUQlgLNS+Yp5T7JY+a3e6Q9VR/oXZ6MM0z2muHI93Ng1BS
 9qIOYa26bvLyHRUaR3w==
X-Proofpoint-GUID: 4kEvD6d71hAxagawPh7zQ78Kl5Ubvgg3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX7PszoekpzUov
 HnxjuMO6tVPlekZMnrV2bIqMHkY8YV+hFMEDHHoMulerKcxSwx0qrYTPe1nsijaK1tr9Z/T0zrn
 9QTKpDQqMkeuMhdzO8o65yAY6b9N1T4=
X-Proofpoint-ORIG-GUID: 4kEvD6d71hAxagawPh7zQ78Kl5Ubvgg3
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0881a3 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NuUCN_VPl_z90dSYpTgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

USB and PCIe GDSCs need to remain enabled across system suspend for
certain use cases, such as USB host mode and PCIe non-D3cold. These
GDSCs currently use PWRSTS_RET_ON, which keeps them enabled after
their first enable even when consumers no longer require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers dynamically request this behavior
only when required, and clear it once no longer needed, allowing the
GDSC to be powered off when unused.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gdsc.c | 21 +++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index be9c14eb7b064f988bb4b330c8784cab82e43b2d..7b2b9ad0485e6035af6c72d035ceb2bb8f4155e5 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -345,6 +345,13 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	struct gdsc *sc = domain_to_gdsc(domain);
 	int ret;
 
+	/*
+	 * Skip GDSC disable if consumer drivers requested
+	 * to keep the GDSC ON in HW even after suspend.
+	 */
+	if (sc->hw_stay_on)
+		return 0;
+
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
@@ -746,3 +753,17 @@ int gdsc_gx_disable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_disable);
+
+/*
+ * set_hwmode_dev callback for GDSCs that let a consumer request that the
+ * GDSC stay powered in HW across suspend, instead of being torn down.
+ */
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable)
+{
+	struct gdsc *sc = domain_to_gdsc(domain);
+
+	sc->hw_stay_on = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gdsc_set_hw_stay_on);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 2f9665b664e606234fcc632c3f6b302a448d06a7..12bf74a1b2a431cefdab955de15ae6b01db7a10a 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -79,6 +79,7 @@ struct gdsc {
 	bool				needs_icc;
 	unsigned int			icc_path_index;
 	struct icc_path			*icc_path;
+	bool				hw_stay_on;
 };
 
 struct gdsc_desc {
@@ -94,6 +95,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
 int gdsc_gx_disable(struct generic_pm_domain *domain);
+int gdsc_set_hw_stay_on(struct generic_pm_domain *domain, struct device *dev, bool enable);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,

-- 
2.56.0

