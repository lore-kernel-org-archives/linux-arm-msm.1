Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181136;
	b=QWaRZiMn+el34zRsQ0FJa6l2KGeUFO0YSeRin5xRF3VxYtbOlvCffnLXkENmap4PciCD
	 AB0fUsGN2T2QA9WM0hXZvvsTCSB56L6rj0AayASwIlzXrhCE8qwTVNUPm6OfYl7qKcwt+
	 hnPl+4Q9qwJNdmmXwQpKbUkHchNcBVJGzArIaBFHP0Xbf9ccqZBYYu6HDtG8ufZen1egN
	 4tTJDD1r7+q87sMlenBPsViQt3h9feDuyC75PzaaPGU6q1tR2EwNaAPfQS8Y0krQC/FPY
	 QM/3OadZ1cEjcW0pFA3MGMuBAQH5V0JoVmJiMPpzKTwigO5tqIgku45XKtHYepQkn8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
	b=p0FnqPmrqRlaVgxbew93Leqr4kzA3/F3upe+WlCAbrWOhNedCkCK4B0hlJruZbPqQAYc
	 ijN4NgryA0NQwiQiMoY7otOZDUAfnpltgqa3GxlfhpEU7wWwwzCbbZbrruLWV3+X4Jl3H
	 L3ECELjLHkCxakj8QsLfIcPgxabOYrLddD18sHo4mGys+pVAbpiuXnSLqICQZFWOaTvyA
	 x4hYBmkGm9LgxUF73ErIHOzv+75MTq70Yq9ZXh/1LUWo76SvE4fTfUg04veZ+8J8QKiDo
	 cZ3InnKXfQNxc/ZzvfYvE5ddRp7rUeu30uqy1+ps2cWYlv8hEg+Ia4LXYz9/O94wjxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF33606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF33606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K8J43892829
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=; b=BPspIupcSsvi9haB
	HEmX2Rdz2Wh7xh2QeYMqT0HYM2hqzT4OH9tW9+7+TqdTcjD93Y0VYYax0/0CH29p
	8lCF832cadaNYTkohSy/P36xpKZJJ6zs2uIuUT2NG8TkpNiNxbew91I3fDUd2xc+
	kpyQz64yewtWn65MARq4/AYYfQaAQTMOGGu9PcggPgtIWNGjr54sQhQLC5jwbu+4
	6txX5VmEGSfX+XTKkGl2KssdLuc89vmILik5k4TVM5kOHxBnWdLonITJwWgDCqsr
	cNjxU0lvXGbuqbkm3M61azBVcLLZmLESPD8GWVBlcBe+ri67DkeZEB920Q0YHmYw
	OyH0yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91u19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so133718485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181134; x=1793785934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=V1DW7NLWm10Jvk03QQ/3RvAhA5pPeFNGHqO9wsTSfM/Tatrqzn+/oQ9fMiimb6mPeN
         +O/Oau3qdQgRmxd4QROowpwxnxwInb+Wr/JTvR5hMwVm/7p7GTRutwOX/z2lqWIzfMu8
         GHJgbVgZHMLx7SO38fKE99NWST3H/DeDlENttq4oL1XIIPMAbo3GfKawKHAQ3Ye0VZLr
         fX8oXamk4HcZdMsEfsoN4lRLHQ3WFY1h+OIM63fNp3e6f1Ldei2hVEOPZ0apdKeg5e35
         DzmD3Xd3ebvOO8yFH3BmuECKlYeR1JY4P5h0TNfRSmB72Q3x+ZAmIi8MbmE2F7jHuXbU
         hFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181134; x=1793785934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=KY9O+bR0xTBU8IfFIN2MC6q5ZxHDwYfVhicWVcHF4xrweOZbXZl1Z0lnIXOsJl/2n0
         Y4i4qU4/3OcEu4KzLHIGRksdZXfrb1/gvmSIYAdyZZkIGXeLxpkrIaL5RSmwd//cPFoK
         bXkycRo6Hdnth6tgmQGpQOKGm5EOnBz4HQrIzUx9mq6DIaGttUDk8136JvFrYyGL7ZeP
         mmrB5blVh+4W8Yw6mKMb9bozs0egRIJf7vA+qdLMKqvlQ4qUBKVUyzfGcfZYtCrBrfaz
         YS4Wda+ZzELFDha2iuxhLyUdRFllyfOB3IeXG7M1sVMN2BzGau3b0Oamlo0gWhM5B+Ln
         ZK5A==
X-Forwarded-Encrypted: i=1; AKwUvBy42hdD5EEhq69sFGC5DrParOpQBrKl024kncLuq/mxnd3NfUHMBOQ6WVnQD6PzyfhzYBIoK3fMPhVpYkEV@vger.kernel.org
X-Gm-Message-State: AFq9FYLadiosk6FeUG+xUl9L0+eJoByd+7vX0VtE3FKKKWjCPsJsKy9I
	ntypkg4L371PSCIBRrHSZz0a/DHJChKJ+7e61JoCP9V1dYgzjQKEM1AweLPVrQDm2IC8nSYEtl9
	sxbt1mPikZAcYFNKrXmVuGIAhbu2ybJcS/2mlFOOuIVPZflkL9pU3pLBNSWI8OV2ZpO+y
X-Gm-Gg: AYBFou2gRsuI+KGsSX4Yf/qtM3/YU3a1CD44O4o0oS1elEq23PEFqr3nQbJ5A6YPY3U
	a9vKnifGey709GkAwxBvW7UMv6FGGsALGKt63wfHf+zdg9PFM1J8LlU+BPf/v7wpLM1O0jQ6bXH
	COTPq8klEOiGm2AVUTmaZsjYpvfgkvy2AqoIJvVuv1FH38HTku5ljCTxJ9YoCvZvXF9GF72/UNC
	8uX3Q+tky5naKyLJKY0YDBQUb5Ib3K+kzFduEN4/eE5sjheAErL7arlGHbELGI4+ItxHLuiY6F4
	YNZjSe4S+G85Wi8yLyw0fMYYmvS/F6XdMkR//CDIQVV8aQqnCPT8HlfT2b6WkgdWWdRskIv7mMe
	gqxQnq07ajwZ6OGkiJpjrlR1tCqPjMl7S9lDs6pIX7uiRaTlaayT/pdVZjeQ=
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227266485a.52.1793181133693;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227261585a.52.1793181133055;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:04 +0200
Subject: [PATCH RFC 1/3] clk: Add a way to restore the clocks of a provider
 after a power cycle
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-1-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=R7OPp69UUHsoM45Tq0LsjlUIHam/eQ9Eg5jV4WSy1Bw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXH40jsyfn2uWVVpD4XgtFR05IskSEQurpPN
 nkWkSXSe/eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFxwAKCRAbX0TJAJUV
 VoOOD/99mJfp2dYwERaYqebAnLDY62/wxdKdDrQNlryNiQ2eIgvF//s6rfXNKd3GK/BI2ly7ZKv
 J0ceS0JzmNb+Af4Q5rlMMqoYd8t1AtWDzcCkxICsHZ8ZBu5ir8A9McXBa8p8KJZiO7w9UVtEKPo
 iyliTpC7rSXYZpcO6V04yG88gdrR4URwtTlxzS1E4zWmflT2PCIHNxOy/ZD7GQinEY0nwwGjf8z
 hpgx93zHAkwdJCtSqsEzWvpKm9zotMbCtYi/UQjRAhimLV22qkcNQ+xclMgnJKo/yDT/hFOVIgX
 HzSumtJgHo9/8Aps1iEiFZBAycLilB3xzeT0axHkqMVFd6mYdrc+hJ38Y4r9GILEfbWcnQ3W5n6
 TbRQYM8G9a8auk09MhwmrSiSWqVj51tyVWgRlr5M5Sa9mcxuuB9KOoif9OT+OkNJrZFMTfoAFMr
 QkguIAGr6JvMqMoDa7xIJM00//1ZtGLYmVvNcb0NDTgAIfTso23XsTF+xn4yDP5Fv4/fP47cY/I
 nafjbt5kF+VVayAC6L26Hf1gdWL5dLI9IczJuKJPead1H9xrlZiSiLTURKAdfgD9JS4s1YQSUUF
 YieHJqxvlsGwkHYoCLlNW8x9Q0f6+OQEn+COsiSkv8DwIsgkbh6dxg0UuV1rI3bhV68EUOEfAg/
 dx0u8b0Tz69/DqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1c5ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=clSAYKwqOTSjvecp:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iZGjZ6MVmCN8NQm4dLAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX7WZgzIl8ymn0
 YVMlLjxKX7sZOnR59+Jdn0vvjZ4fHbSj2HgzfHHH5rv3Tes+XaOD9lW8aMfk6iLHkKVPyndxCmK
 J7Y6tDfUML7GcKlcuAZoQTt0aVWVCoY=
X-Proofpoint-GUID: OydMZ7J_YQ3HNulXuCj358nRL_QFuJ79
X-Proofpoint-ORIG-GUID: OydMZ7J_YQ3HNulXuCj358nRL_QFuJ79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXzUAEXCr3cnS4
 eLTRZVezb6DESZsoWN0SxGs855ReW6f3vKpRTuqx1zEUQgbU71wdKJyX5TW3D9RRH3XMuBa4d25
 hnwn9NY09WshHuoCAa/ECcFGZXdZFc77CNdzM244OP2tMLnd1EoM+QbziiTS+i79aIQWdNQC4A3
 hcczq3F8GsskYg4wfzm521VGyCEVc6Nijttz5/NJMwzwBopAPjF9pPo86LnD5QALljp7VECNprV
 TuO8QvpM0HceKezdavY/UGnn2WvU/v8VTcGjj4Zaor7alZKcAI1YMZMdu2IFNOl0Y1ZQy7Ov0F0
 IMiR4CilAwsSlZ6kqBHWXmtjhmxUc9v3ua1wyiUaTyIAT7Ra1GGe2C2gvVMhb68k9XxtTeXQ7JN
 13f80IWUO7CG8+8+dD+hrR/3O773Vka0/kUW6atL6Ll5y1ZFwHRsz6dUQTv/huWSW87DVkGaoYm
 ohWDT5VsHbO8hMdmrlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the hardware has been through a
power cycle and a boot kernel, while the clock framework still has the
rates, parents and enable state the consumers asked for before the image
was created. The consumers, when resumed, ask for the same rates again,
which the framework sees as no change and never programs, so the clocks
the boot kernel did not touch keep whatever the boot firmware left in
them.

The existing clk_restore_context() depends on every clock implementing
the restore_context operation and acts on all clocks at once, which does
not fit a provider that can only touch its own registers once its power
domain is back.

Add clk_restore_context_dev(), which re-applies the cached parent, rate
and prepare/enable state to the hardware of the clocks registered by the
given device, parents before children. It is meant for the hibernation
restore callback of a provider, so it is declared in clk-provider.h.

The restore_context operation is not used, as it relies on a previous
save_context, which only clk_save_context() does. Clocks left enabled
by the firmware but not by the framework stay enabled, and the phase
and duty cycle are not restored.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/clk.c            | 68 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4d2cc86bfbeb..316c3c85f247 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1449,6 +1449,74 @@ void clk_restore_context(void)
 }
 EXPORT_SYMBOL_GPL(clk_restore_context);
 
+static int clk_fetch_parent_index(struct clk_core *core,
+				  struct clk_core *parent);
+
+/* Program the cached parent, rate and prepare/enable state into the hardware */
+static void clk_core_restore_state(struct clk_core *core)
+{
+	struct clk_core *parent = core->parent;
+	unsigned long flags;
+	int index;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (parent && core->num_parents > 1 && core->ops->set_parent) {
+		index = clk_fetch_parent_index(core, parent);
+		if (index >= 0)
+			core->ops->set_parent(core->hw, index);
+	}
+
+	if (core->rate && core->ops->set_rate)
+		core->ops->set_rate(core->hw, core->rate,
+				    parent ? parent->rate : 0);
+
+	if (core->prepare_count && core->ops->prepare)
+		core->ops->prepare(core->hw);
+
+	if (core->enable_count && core->ops->enable) {
+		flags = clk_enable_lock();
+		core->ops->enable(core->hw);
+		clk_enable_unlock(flags);
+	}
+}
+
+static void clk_core_restore_context_dev(struct clk_core *core,
+					 struct device *dev)
+{
+	struct clk_core *child;
+
+	if (core->dev == dev)
+		clk_core_restore_state(core);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_restore_context_dev(child, dev);
+}
+
+/**
+ * clk_restore_context_dev - restore the clocks of a provider after poweroff
+ * @dev: the device that registered the clocks
+ *
+ * Program the cached state of the clocks registered by @dev back into the
+ * hardware, parents before children, after a power cycle the framework does
+ * not know about, such as a hibernation restore.
+ */
+void clk_restore_context_dev(struct device *dev)
+{
+	struct clk_core *core;
+
+	clk_prepare_lock();
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_restore_context_dev);
+
 /**
  * clk_enable - ungate a clock
  * @clk: the clk being ungated
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c3a095e8da5a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1439,6 +1439,8 @@ void clk_unregister(struct clk *clk);
 
 void clk_hw_unregister(struct clk_hw *hw);
 
+void clk_restore_context_dev(struct device *dev);
+
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);

-- 
2.54.0

