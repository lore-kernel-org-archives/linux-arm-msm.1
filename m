Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C54BCAD6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328592; cv=none; b=gxI1A0+Zbn/BS33mbA7slhxj45eP+eTWZ/DHKa/iVCx7u/enAlDJ3fCiSxKSH3dg+CtW0sbMjMrtupAoN1a8yP1DH5u417s31OOf8zdmVROUubWE5atuHmWfqmRHOxwKa+PndusPY10fBkDc0IQKRAOxh5dG2SuXWRJ/0gynaig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328592; c=relaxed/simple;
	bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T3PmbhG+0pnnsS2lpYi7tN/oBvAlcsPVtHeBGPIHg6knH5pULyeZa0L/5JgbGJDPLqoxLIHus3oq/OHsoB4vBZdzeprtRA5bd2NdQJCyv8vsSUMzDgOUve9UrgI9evYPflb5UxZrGihRQ45q1fmK6kTxelhULfDS+/KSBVMRdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HvNWmG3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg/T6h0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HvNWmG3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg/T6h0N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm69v3876549
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=; b=HvNWmG3cGQB5SN1o
	4S3jxthaESGU+fyHigSOwfsTnZbKqpVnpCTbUecz1r5nSNMMinJgUXYolTR6o3ie
	8wT2ApfQ5/PSaP1GxDXac/14trJvUBgn9tAO7dg+OphPz6xc3jQIVWU9RdRzFIeJ
	ScK2Pz+RmxS2j1IK1IQfxdtwJTHNET+gP8z/o+9WwvZ/uyBRlg5yyMDl5RZGeNTn
	hiQjUdmKJb+cX8SYYCx3s1v+TjYuRbNCi5Fj736JNVVo6oqkrkthuws5OxUXtszV
	inVG5sRuw6mgdK9RC9i8TLgwY4HKQtOJXGnh/1YWyslE4VuCjkxDatf9JN/Dd55W
	10STMA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9thtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:09:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so2096877b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328589; x=1787933389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=fg/T6h0N6gDyPrnZExDJ367aZ0Eg/Ku6g1Adl7tP5quVU9SJO9StKe6E+Dur94Zipu
         SPu8W3rIRpu6uuKTrIsUIdm2BUk9CF4ikPJrm3FYw6CRZl/+QWfvx69Y81p4kOR9sANm
         9cJNAve0F1idYot7jYPQXNJnxR/WDGZf46t3ZYbYHPoVRNWMnrf+xDzC3Y1UhshudEhf
         QN/ki9A4z6hqOg964g+QnU5Qo9RPSSzFlLPFOlTfhj34O46zmkRfoNXUFOKPpEl/RxuO
         alEIJQ/gG5csaycMQmpxLKwlidNzVSCmEZr9lZ05JEGkV97XbImuVTe16cQUHG1Ncmzp
         KjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328589; x=1787933389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPYfTHbFrfi2XEod5q3VXPMVscV9WPdiBhHDyk/uC10=;
        b=Z3JGcu8VCh/uko2gxRA2fi9efNBv0384BX5KTsBmKPpdvW3zAgzT7Rob2ijw8AiQHk
         HiRakKWkDW3GQAGNYiojphgHhjJNCU3gCeu++CHNsFGz1XsuMoRKkozjJfyJCWfa9dOo
         xeeo5lq8u6K+3XCjkrilVysLiF4CSY71ldMdJAVRGGzrvxmQPMnG/Pq9ecIi+31oDPW6
         CBmcD9O/82dzSMV06J53fMFzqMzvWSyoTvFX6FCPzwRgdyNxE3+CpDVHqMEJlZqifC5O
         CfiRAhOboJjFcasonrHE1keC0ALhQIvIvxsdnNVRjVXQjcqgIsK1Qon3hK8TZpU2wrvm
         Xnvg==
X-Gm-Message-State: AOJu0Yzhzd2rhDSpvzGh40d7M598J1+15gn0SDil/FqSdmLJllI+ZW0g
	vHJ0eta0J8HJohuiD/b19HppT4nrFfXIrZ8HVL9trw5mNJONXUW6Sk19wkOuIyOB1go9WPUcWng
	bfXG6wUm41ahe3/25rVDKsaQiWhPKK4anaW5cUCCFonFNLXqIocGVCVhESENVUFH6BONh
X-Gm-Gg: AR+sD109WMwSjsUc/VkI2CP0S6mVtwQOR50pppAfUal/bJchbtIyMk5h8LueM9PcPEZ
	rjZnjm3lm3DlaTgJsVW76/TgrBSBEhRl8HjgUmwX0acrOvHtRvkf1GwZV3JzzxZfoOGvzdt+zWs
	QYTjND9VvcuB6UnFfToxU6OcBMDrxSTQzHQ82Za8fc+pJQy0mbAenunteuaGzIkezf18R0+qUw2
	9eKHsHfxuFNkTGjRJ9kF8VuWbJPW2Jw1r1TiIzFZ+8+dEEQZi4W+JQRDKk8Um3EejRgFvpvxVBX
	mmwcXhTirRj0kxxQWM0/xYLeE/nYZxcuZrZiVyByM0LwoJVswAWTc84froef/pcEq/S8ZeoR9BJ
	PvvjPg6r5C/HCL+mc1WZRUKNbyVceM1RK2Yf4ekVzqtEg+wJwoTME6qqmtJlYTTXrvFSEgXD4g5
	mF4/IdL9R1Z1kDYEePk6ifIxI=
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078442b6e.3.1787328588580;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
X-Received: by 2002:a05:6808:c40a:b0:4b2:8ea1:b9dc with SMTP id 5614622812f47-4b2ef175630mr7078344b6e.3.1787328588130;
        Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:47 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:57 +0530
Subject: [PATCH v3 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-4-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=902;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=PwVD29DtUH4dIGkOMbXE9qMjiF+K6OUxLIjMJeof/6o=;
 b=9IPV7eFcmcQy3YV7XduUDzVOHCb0O8TQeRqyjO8MMMACqn9sPoWMnZYcaAMUrzKUCuPu/vqFO
 PVRyy4d1nvKCgSpIwfSYSyxpTfHjH7jkE0NF+jGaoQYV7MN4Ry/ukC4
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX6R5V+dbql+J6
 GmTZLy1T2Zi4HTQUtAUnHXnN++4MSa7O/PcL5l4JxxeAhj7ckvH3lNoWF+oPCeE/S7iv/WXIbBn
 aNEtDAwAqnHmyKmD7x7ul0P5zkV2abOKOWjGZ04IiwJ9M6mhQ8/oG+BSAymk3kLp0eUpWWX71UG
 raoImbkGWtaC/5gvRIeQ8wezt6AHxe1JO723OLNgudvUj1YSTCfXTb5H1N0fWToo4QWOoQueKHe
 GQRkED0C4WeKrZeKCK0GgRCLt2sZRpdFmI3gF9yEEWefVZ+qFN55lN6YRAPCkUhFvfHuUwFKNOr
 O8XAl2O2bXUSQmL/hC8wlaE4z0AQySC5auxFM1AgYOKdVA5wj8Su3WJ9SC5NxUG7NFW41nV7qFH
 bW78M5UswHZkSW44RoBDjp63dIfg7x9jFf+CvdsdJYli5s73kYwDFiZyXG2bouHM3wY7BJ7hI8i
 85VPvxMLs9wmQaFmSFg==
X-Proofpoint-ORIG-GUID: WkbFnRiRKOEFGjy4lsy3UC8xSMs3iy_3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5Aby/uV/xz1E
 A4aYbTazukiUDiNzEfDcJgfWq6qy3M4U8cmW6LtEytGU4b4UO8kk3Iip7i/GgVlx1gka5edKTK8
 GgLPEco2dk9FCYuv8Uw/ZlAzyxxFQpM=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a88784d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VE4QQHX-7aIn0oL__EwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: WkbFnRiRKOEFGjy4lsy3UC8xSMs3iy_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5207..9d521ac9c33f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,glymur-rpmh-clk
           - qcom,hawi-rpmh-clk
           - qcom,kaanapali-rpmh-clk
+          - qcom,kuno-rpmh-clk
           - qcom,milos-rpmh-clk
           - qcom,nord-rpmh-clk
           - qcom,qcs615-rpmh-clk

-- 
2.43.0

