Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254641835F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572571; cv=none; b=d/dO3Hqg5BSSAuEOrCIfaRrruTY4Pc6CgbQNQkyBJeCWqKaCIFPdb12BTCsHNsnGg7qQmZyFmfExh5MQWDY5VxQoJVf0VjOAsSLPEGWZQy5N1gjSdOqMaESKGZ35Y4C/wiCxh52NCxcoccxEfnYDMpqcam9G4EBdJ4KF5V+0L+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572571; c=relaxed/simple;
	bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/4V4PPaZizVH1zcRd06ekM9BGboqNDwIxZDXiGdEwFGNZYUCnm4k+ZiVtIa6BaLX1fd0Y/dqBBtYLKwX9du7cv6AcsL6Y5JY0GSg1dIVfzOQFH4PlCnBKKrUu9JMmkgRRwbRooetPQmqT5vrBtjH1QhyDmKTUw+cH25phOP3y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQrGtPkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwBiSnMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQrGtPkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwBiSnMK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdBA3194976
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=; b=XQrGtPkLyb/1B/ej
	Lnj6mIFbSH7kDy5BenjWDn0eVEM3YAy5zfXQUDYIgy6Dlall59nNyHg0sC2GN7R0
	SIGZMIBdzqHdp/MHWBNfMcscar2qngmaxcYmj436NCMIvbIUGxE4qLaiAXYGks7H
	MGt2YzUOdLW942Rc3hYhzzxR7f62AYs0YA5+FukTirDGSF9PRBOmKE9hWBUysEFa
	vcF2jPn6VH1tGcow7oVG4qs5taG8LwvLJ5H8Ngk8JF/+R9ToZObnASlHgPa1TijF
	BlbyexpIjVZOH2gORca5pkRY3h38JUTlTJOgeb2a7/ky1GDNiC3tk5rgZET1gOkq
	EOYlBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so64378091cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572568; x=1788177368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=UwBiSnMKl8ife00fXV1B9rfAQMmTr5tGJqxEVOc7nYE5wzrLiIa0S0YHTPsvvRf1kN
         zOgy5VHmn1y68lgRgzFkU3u+v/W32rjFb5R2lEHIbMAEsmxDcfdeUA69AI0s8tMwqg07
         zYwckEkW6a6pU5o31Z/cggRU2YZZKWVpftUV62pzp8Y4rqL7RYgB0JbJR9MGefTuMx1G
         xKpDWfx8+GsWEkexJwTAUScv5bNgKlgtLbM8rpPAoGw9X0FOx4yaUG78ogY3F4xLwAnu
         r1arW4VNUJTTWExiivABo+dPAgEmzmaHZ2BD+THDW6rXq/kVOLWTpajiqaeFW/XdaVqc
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572568; x=1788177368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQXp9YA5fkRhAcIQTgfC4c40+apG+QTyCVOqmtu+6z4=;
        b=PGMlLFypw3kZ8nhKLV+XqGdSLEAlkVFExrxJDBcOGOswX0cmYMvOsIDXPipbxPIP1l
         6N6OQa3cJIyKUUVnMJlJwwSoucKc1+DurDEY3DpcNn+VlZ3tMtm1KPhAElUqQ+RfkPfO
         BYs52Kaeme6ZFnkIwiuGrAxAB3gAXWgFkEQkfD6IyxC5DMpyZ9fH3+9FxCqcEeT0WRZi
         exSyfyKR+lnURDf+6siEZUlotEAQ17x4IWnhYcQraOEVJshAOdE8lyvwPwoiQvyd2zMb
         6O2hLIYSHH0rO95moYAiYSjfppywO+ry7jYWWOsFTQ1j+L1hV4PQLO7EeMVQqFxb4PRQ
         DI1A==
X-Gm-Message-State: AFuF++mUbI6FjP5btqCG1NwpgHBl2G1RJTFCZgh1TNbc8baVz6ykpmgW
	dnhIR6qAnz7sJpEp3hx1+Hlt7mGynpUv4sNtWsRDUIm/eonXCh1YqTkZFRUEQkdt2pYqfFuw7/j
	vBiTahxN7qpfodgPwYE8nbmrDgu0f/SmVvipNlRl47j1jOfzLVVTt6U0P6BjwjdK4viCX
X-Gm-Gg: AR+sD11XhJfA3w7fFkVuuhvyaO8ZswqlQiclkQk5+vbsyPMcrY/7KlAD6V4PG4YEdsT
	qCuepHEa6vs64Kp+WRUqyk9bobPC5R7hL+OpPbbEktXJYDhq1djn89qkQW2EmXFfhr1HRay2BNk
	5Rxa0w2UxhCqVUZ5qG6+S33nrlkqUaG2lVCnAkkn8mgDVnBRBdi2EkOG7D3gRBLki2SgjL3aLAo
	mH3vjmeDC6vZM+qVA/k2aY9vA6cVlzsALr2DppEWR/rj0I+A1tVQhujTHNaW++FKbs1d0BpJRCz
	QNlPjaHoC9SeFcx414StpouJYPVd9UjV/MiTYW/tr2Q3piLXH6Gnrvt8tuqFpyak2DH7r7OXMSi
	x65OhYNt1
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256263921cf.31.1787572568252;
        Mon, 24 Aug 2026 04:56:08 -0700 (PDT)
X-Received: by 2002:a05:622a:989:b0:52d:2ddd:27c with SMTP id d75a77b69052e-52df59b1033mr256262991cf.31.1787572567689;
        Mon, 24 Aug 2026 04:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:15 +0300
Subject: [PATCH v3 28/47] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-28-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7qPJx0L9ZJ8IejD/1N0QGo/uon+hk6wPWX6yn1joseg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDwVvYy6gwuqmzwEKypVSiqIQtO4/Fnxqg5X
 pEg60ZT5waJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww8AAKCRAbX0TJAJUV
 VqFID/4uBw7fl54V1epuuCQ9n1YQ2zOuUSnHrjfLz95NrG4/wO477aOIY0zpZ2BcwGnpk2dGe46
 kRoHi1/2hT9i+RhrxuEK7/dd07i1Gd3eTGbOmKn7TEljpOr9mDJlUfHmLkUSAB/xLbffcrAMiKV
 +ZK2ryyYRgbpu3XxDLq+jYXD5iH6Be0NVzo5LLMZTsd53/qPZ8bk2JI7OS9qkw2vOYnh0eTHoCj
 JzecYkekztBwurrKYh1IuFDSwBTqy5x0EbLHmPdukrqLbhTfZciRZLxV70Rf8rXdQ0hXR/CBZJE
 ASOy8ih2cYgSWfgcJzPnRlBfOHG3hbFq0Eksj6WdNbCuJRwoNv2EQO+qVP/w+Jtv7xW7Yoosc4t
 4RLbqfBC7vG9A0gSLOsteBNjJ5UWiIFx9RQw9a4WAgkQG6Ip5iFeJY0vH7lQQWdRcZWPmpM2MPX
 DuPGutKU3dOWnljr5U/exGbpZgxrosZRhnZnbt/+GfbmuZhA4ErY08s+lraAwllXqc4XKcK63AC
 dbaT/+ovTZYYH517B8gXmTQY1/WeJUCs8Fb+N5ECd5t7Rge5yQrW5aGH5QVLz4B7sCOpon3YxCq
 yprJJ/8MuVI7lXbX39Z9DYmhMmvAy6SeaadeOCOT9klW7JbpiSOV6GNXWA2+Bb43wUU+kK5h22W
 frtd/+EYI+N7ekg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXzjxyiimyl8sq
 DBeWlMR0J0L2zm32/0wtaWQukh5G+MZKCf3QINR74ImBady53PHnB08G4tkogn8xb7wUeRt22oi
 XSjFZSgCN++q60IIetcXhlx7/yX8I0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX++mM/v4wBEWu
 2v27SobyY8M+aDeOsdnz4IMM639m14W0QKG23rsOdxxHR3nV/RApfXegspUutvrzhBdeLTuWuNn
 ej4l4vRDTyraKeofJbBsjI8RrLUzY5GHh0CWl6+4O0hvnKpcqUTvI/6Q4ECCnU7XcX6OX8ybhQC
 bACUTBGnjpPdOvK49+qpOxXjDyO6d/Tu3ED4wutscLwgIoDWw6yGb4H8oBo9leT4EUOFSpfv/N/
 GXPYfQhw0922Zkz5B4007hYQQTs+z4ya0g4nnyFnTwqIfhpoQESy777YIJJRYmiU5IvQ/Z6Bs0O
 kSbhykE9lzXxETVI/qFpSBEr5um4fw+A90m1BKawGjQWdbC1tnYol/TMiu2lYRbHlAuHuHifxjH
 t/NGWII9bZHzETv3IQgEzu04SJCwyv4n8rOHy5txO0XmI+7XGvDLuQyRd75YQnRdL2uAJL/S3Am
 8V7b/PaW6dk9WrqJe/A==
X-Proofpoint-ORIG-GUID: EnluC9ihm2w6Uh2u_s0zdPfw91x-9Sh4
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3158 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: EnluC9ihm2w6Uh2u_s0zdPfw91x-9Sh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

