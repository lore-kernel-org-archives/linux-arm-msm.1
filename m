Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008242;
	b=glf/1b5wPhstt00/Yd8gkZs0UUpoXv1yM+cAr18a5eNgysNCOx50lRG+fxLcfEK7DpPR
	 OFsaCZrasxlOc0/CtfPC5W4OjTS4cW99GL8H7/IforZ4yYknhTof8KEjTePLG+Zx+Ganq
	 bhtEnmYFlFg3dSxb9mQJZxMA2ptj17jBKnHoPArxYv5ZjHXbFpcUxTv10YcnHqoYUavO0
	 wGIh70fN9k18bhhgFs9w4CpCuvl1bnVOzNsTlR49olt+p2OrrZKp+WTPUE/xRkdUYm6NB
	 qEfmfWWThqsv4w22/HVCvD7hZOFLjS9eAwuoDjjb180DvIYPanN3HNrbHj3QbH5tuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
	b=Pfla5rAz4ZjfHz/xuUo+tYNGJwb/4TPNbfaBLHo1mJFeW0kf+eIZHcm8iY1ZcfK397hk
	 eEiGou6b0fKCjXw2Q1I9/9Q3VFi/tzbFnRpQwNTEKScyFLABg/Q13Wh4YhHYITt5JO2Jc
	 MbHeddRCrkYooXKnd6BIji3LV3AkVAjfoWjgyS2SOQ6rnZ9bXNcj02NAIa5u8FEno86Zt
	 gRAlJpWYhgTm5bQbLwe2AFcDe24upEADdXWrNdhgLc1zNAorWdqm7/8W0LMnDwhG14Vll
	 CRQMHb2O7bk3o3Wg6xQ4iZ2onbGWuWcuTmZUpXdMHnCNYdWtiODWLuuf69FadWRTwVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JGQm+0Ls;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F8606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JGQm+0Ls
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2580562f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008240; x=1793613040; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
        b=JGQm+0LsjE557HWKhkgpTIGq8NZRQEXgnb22iQRrt3j0T9pWClsXeEHDTmweBKupAw
         OB4lwRE1tucXnssp85Z8Pv/d67RE9z9C+MRb8jQ7OYf7S6t42G0maSbGLGos6Y9+l18+
         mmy6O4V4J3BnwUF4PcGj8YxsD90CJqs7NXXzr2zhou7vDcbLyzc8wCzIEjUQKc/8yJpo
         mj/ljNls3yjXIUUDFuO46UMbevtdjogsZVUfHt67bV78T23oxd2dp3x7pEn6SU35pMER
         0HZreOwTR+PyxuTMmUrJJv/nt5Zgr5ERi2E8KJI0ggcvu2zEREDuY8zQ3FtY4sssofGs
         bZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008240; x=1793613040;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/qEw4Q8zvU9ZQLyNTnQ35QU0eJNJDp7YOem/bIKsvw=;
        b=n+YEMepA8X0awpEoc5obDIaXW3cZWjzGy4VetqD5G9PfxVdyuv89yoMa0zpekJgYdt
         Jsfjh7M39COVXn9Qb/semJRN1IJGCuyu6GkYM2QtBi5JPXNtBNZptyi1IaDcpvpImdVB
         BJmw4PZh0Z8iSy8VHy5opmnEofcfxKXT8pqEI3eJP82dslcDQ1PGR04beNqi6t/Gk0Ud
         zbwK86lpdEchCUl1v2s+mykR5Il62qoZYPPv7rCyGsziX6vnzpGf6G1LtB6naBx3ixhf
         oN2JSoq4Ac1CaMHwH+sqZ/gSFdImMhO2C4Din0KuGovwd+UIimZOmyylcO+e6Ecy8h8y
         BpnQ==
X-Gm-Message-State: AFq9FYIgbd2yCA1yxzorqP++om6UDLm5QZfs4+BGZlcqsrz6rS1Si4F2
	KJsMDeyNXMz26hfGV6gjByoWRJ9pQxGvdPZ7NX2lZWlOKSU8ZaE1lkvrH55zxEUpYXg=
X-Gm-Gg: AYBFou0oHs9Qp0U/voM4etNhE6Nshv/FDfxGWBSb4ZcqMtB8UbVvnlLaKQsDo6NFxja
	9urna4tL72Upo6b+lSl/FYUNLJ88D6XjZWnc+IprssRd7kfybe8c4ApCTP1MZh4M4R7smEB51l5
	eLaw0a62xqXiNPmRzgyjAiFk62zhK+601EkYeF5V2D+HaHRDkYAN+44g8469vW+4kmIIrUsT9iq
	JV20UW3INmTAycUqrbpV+1JcKrlccVyTlmj3PL2Pxu4qBrnpyfVfGzEAHreSH9kMjKskTnVp0lq
	poaKEcaRcM9MMjPNHvbLlTzL4tfUpKBaPF9R9CEz8mzt93lZbheMufW/kMSbMxW+noru3cL/QYx
	6PoEdJwvnZS4SSdxmQeoE/EOrUG/I0J+O2bMTYW6smKAGEHQlISMbMIyTwfJVPatCCykIx1pqcJ
	3T46I3vaOLB2ak5++lntidz6m/4ZUhf0DCK40KFbty3/2TNB9n1h8jcZgEPiZM+3emIWizAWsbD
	wJ5wT0dAGafwTE6ZM4POLPGrHjr3hlL+h1iEtiZUeribQJyrBfBY6jPMJMmA/Svts8z8JEgKdFg
	lA==
X-Received: by 2002:a05:6000:29c6:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e3eb9836amr7414953f8f.30.1793008239426;
        Mon, 26 Oct 2026 02:50:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm15524019f8f.17.2026.10.26.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/3] arm64: dts: qcom: allow SM[456]50 HDK board to play
 audio via I2S
Date: Mon, 26 Oct 2026 10:50:35 +0100
Message-Id: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAGsi32oC/43P3UrEMBAF4FdZcm1kMvlp65XvIV6M6XQbdZslq
 aWy9N1NV9CVQvHywOQ7JxeROQXO4uFwEYmnkEMcSnB3B+F7Go4sQ1uyQEAHFdZyjOfgZT7VswU
 58DzKvn2TAbN0rdMeLXsmL8r7c+IuzFf76fk754+XV/bjCq4XfchjTJ/X8kmtd//pmZQEibrRB
 B0boubxPQyU4n1MR7EWTXhDabVHYaEMekWe2RK2G0r/UjXYPUoXCipyptbeaOg2lLmh9leZQhF
 i+VvZ3zXbVfaHUoC4R9mVIgUaqLJs3B9qWZYvs4bSLQECAAA=
X-Change-ID: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B7MILSCp6UA5vj4+o3nipg9IRcQy+2bwsNvR4RRnWIg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq3yJszfjZVaRJsrzIiFG+C6u+WgWr/1g8lUSVm9vn
 zd9Da2WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCat8ibAAKCRB33NvayMhJ0dDpD/
 9qvgiObhB+t5NKdXo4XcVgeCIkXP1xU6P32pBotSX/LEF6x1My5UGCqEa/PBkynJzB9TL/pcTza9Jl
 NUOw2jSpbTU6XD4yTW1SlHjQLjmZhWbVX/4naYwtTvsnlX2U5bPsa5mOAKZpBJY1/5n1bHiIIsUF1l
 Kez/cCjJjUWMpUgY/tK6VnBdRY/SPie8nT5Ve0FqSBdxWOyJvA1y+VPANI/dV/iBHcrh9jI4fRhC6R
 jjgjXnPlYXI+vhRrd1AWGP9MJ5+1+Fi3oNigyWmhdCk4+/TDQZv99buZTGrPjO/g4NJFdVvlKSBXKJ
 GnWJTgsLt55F2zu2c+8doG7h9A3lcBRXQQMNN9hLGayDdesdszZRI1q1OVhs0m/QRj1qmo5l2fOz7R
 Z0oedvKSkGnzgbUMyDB+NliIiAfJpVl43zwxl13/+GlJ47QDQKoUsNKHPFDtAHR18d9jVcBn29jc9w
 qOq3kHxD1p5FWS2jusnqg0CmFQtbYRX9X8jW3RSh2nkNg/Eu+qGBfDzgx6+0ntCIG1HizmdRBACWpY
 dI8LMdgi+CaG0Mx+GTH24d3uKWoeYtZjmYSTn+E00HRLlKKPQdT2K590XbCx6POHGjVndu5XSedCFG
 JbfVF+Y/6GkuXAw+YNMAqEIB1rcGSJj2ertTOoV975+eDjLqha2E7zRwbNow==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Following [1], this adds the necessary settings to setup
the I2S link to the HDMI bridge to allow audio playback.

All dependencies are merged v7.3-rc1

[1] https://lore.kernel.org/all/20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Handle the display-card overlay for SM8550/SM8650 HDKs by disabling the I2S DAI
- Collected reviews on patch 1
- Link to v5: https://patch.msgid.link/20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org

Changes in v5:
- Rebased on linux-next
- Link to v4: https://patch.msgid.link/20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org

Changes in v4:
- Rebased on v7.3-rc1
- Link to v3: https://patch.msgid.link/20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org

Changes in v3:
- Fixed node unit number on patch 3
- Link to v2: https://patch.msgid.link/20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org

Changes in v2:
- Dropped applied patch 1
- Fixed node unit number
- Reversed clock names order to respect bindings
- Link to v1: https://patch.msgid.link/20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            | 36 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 40 ++++++++++++
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 36 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 73 ++++++++++++++++++++++
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |  4 ++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 35 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 40 ++++++++++++
 8 files changed, 265 insertions(+), 3 deletions(-)
---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260728-topic-sm8x50-next-hdk-i2s-6d63c25eceac

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

