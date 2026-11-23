Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468663;
	b=Zq4r5aujf61YQTY18oGirGFsWTu80gubNFlPlGkEiwLG8ueauZOf3dqxwU15Q34N1L7T
	 jR5X90+XTgwzD6cXJy0sWMd2PDasAmySkP1Seht8JhsUfarYf3LpVVZHwMcyXTZKbS6Mz
	 5R0O/YlmOtOTFo5Gwe2ZiDiqeWfHdw5AkBx8sEquU7EFsaqQCCJrYyoGjh58oHAF6hDD2
	 WzaqZMMPorBeaPMwnvKTfJhIJt+3S3Wu//UAdCJvsPOVWb82XgIUUlaj135+CZLwaQbKW
	 JsCqIbU/skk5O2j2q2JXKAnDPK1ie+WpwnoAAfL3u01/y6iu/gxyXr0g9v+yEZ2sy0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
	b=ZMSU+P0AHjqSEB3oCAdarXaatveMr4b/zNxpc9CBKLZg0aHIOcWi4wX/O15GcRXVKX1R
	 CkNbQvwck0pHmD6Xm18oVZEmkvVwTAgMXbbVIryGFWSH8XrE1vvp6tGrOkK4AAt0BPdoW
	 pXEb8yfMAhqcl2jYy2AX807vLiNckeXXkDvJS6VskZnnOiuibZ0RPTo2f37xjJq20PjkU
	 Vte/w4wAoUcxPIqwad4SnCbkE93s8ABV65MFAZVS3LKpgNcqXRq0O/kWVYdSm9u21m618
	 0jR6zIOfR2pDtDAODyyZllboTOd0Dq+EKSKoYpkK4GIItsoYlUJhe4fD2YlUGRq3lUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634F606A33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4634F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2251185f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468662; x=1796073462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=0fedjRZx2RaPeNewDfT6kMMnjXVPl/B3fA1gPsEqLujR7kcW0NYtdJYVaByQandrUq
         QJzBJ4uC9eS8a+ayksMogNxSExWs0eNFKItvTDKAx6NHc5x9hqv9RQlhAAzaAg7s5gs1
         9sbtbyps4kPCKude8iZa2iiFH+utWXTUN8TCJqFX8mRmvPPMu6I8nAQcyMZ4i4mpzyX5
         Cp154EF42lPno5OVkcDwnkP37Yni0BUszr0xLEoRsNB5R9GRF4fxmXOCy5ua5f8Nqhrg
         4AybiECJ+X7fZBXujwbzZQ4s2TiblfJ29wOS+plEAwzRWxdPuG712xtYts3o3CIOU5fN
         1RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468662; x=1796073462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=YJNV6jMZOMSEbD0Z86+lbvlFDwosWlQu+iimT1mSt1TBCyPxlf0OLMg3tJPDLguR1B
         lYiLrnbCz9RMIuCxUIxc1VJ8CHmMgc+11gR0MfPUJgMCSMu8iqP6iB4KI4oU3QhB1Cu7
         Yg9wjyJqkBmOdexjfh3nLPe4bPJfy5mhdHFJOVdzKQTJOLYpL3CE6ANhbUu7CbgO7x87
         QPObtoumUher4OzTigVUgxDkXVyB/ocbSTJjpyotmJ4ads5HDnXleRquN3WLhkPdDoSz
         t9ys0iIZdyqTfdg7CfQL3ytY/rvTwNGaV9HEeFdoFmZD3MfKffXkso5eAGMdbo81s1c8
         hFgQ==
X-Forwarded-Encrypted: i=1; AL+hErF4pYWRp79xGY6DnyYftxhJB/w4ucaubeaS5QUJ+qc9RVvx0TQgIPwexP0QEP1eMyVlJ7ZjTP0dQo0hUbFm@vger.kernel.org
X-Gm-Message-State: APuU4Z+kev69JVsMBXI2Cq8NlpHxTrwAC6nH1BBJJOAeotBnTW99wpYL
	S6rxAWP9rsKEOuZ1Pc/mvvdJ4dTYDxBXgrsOecQnc880IucGFQ4s78oD
X-Gm-Gg: AZFdTZfcwPo2RhbjUiz+OhrPZYTKVfSU7t7/+4szrzD99Y/NYJAhUInGu+ZvBXfEXtY
	4FmC61Zq0R7S06iyIMKbQtRW7cC/33sQPH2jOGTBWh5Ibl9JJGFgmSYca2/RVEkqd308yVK8Qgf
	3YVC78wOFimz/EncznXQKnWJjoEq+blEXCMulhC+2BrlMEhULRjK/RwzZFU8vyWhantEWa+Sh0x
	zbbDlfpDj7SEgUNxXX0mxrKcfmRRwmbdT3bYoo/myf4hTwGy4KFvzNpSMH6vdO5vKnD4rfuzcQ7
	2H1cU0mhiNUonzl7xtldDY/8hwlZz/EbwYlVry9SG7gXIrj0+z/oX305cVisNDUWhD2jVBRIfrA
	Toe8oge00qS4oK6SBqfh93zlTUexF37a7V4xrOtMG2uVXRlOopxav3MzeS5kLhBhS/+F9GGLKMg
	pWe01WmgIeVpJqX3q7GY1AHC24OXGVwjBr5cKEYFan0+Gw80GM/rsiq+m7MLTYO+dBrtofK0mVz
	+rL1m4Hb5DBpFH55sUynV0GXjsvXJVvhefunbOcqLvzPdzN8LJJWFuzz57cyQW3ZJkZzomC9cIa
	x6BlsBaPbDRsf9sN3YG+oJ2o2MCO6/mNlJjEfLq7S1V0+m0g
X-Received: by 2002:a5d:4605:0:b0:4a4:14db:2348 with SMTP id ffacd0b85a97d-4abb29105d1mr18698069f8f.35.1795468661504;
        Mon, 23 Nov 2026 13:17:41 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm24513121f8f.6.2026.11.23.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:17:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Mon, 23 Nov 2026 21:17:23 +0000
Message-ID: <20261123211723.1065310-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com> <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com> <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
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

On Mon, Nov 23, 2026 at 01:09:26PM +0100, Krzysztof Kozlowski wrote:
> This should be rebased on my patch removing the IDs.

Thanks for review. I will rebase it, but I am not sure about
the order, could you please clarify?

1. Should I wait for sending v3 until your patch is applied?
or
2. Should I apply your patch locally and then send v3 based on it?
(but if something changes in your patch a v4 might be needed)

Best regards,
Stanislav
