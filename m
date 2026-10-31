Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463888;
	b=wISJIuE04ZC8WeeGCVTq4j11gMWeN88Bv1TdLP/pQDx5Fu8xyEdNMBuCLJoDv/K32qLb
	 VReHfZkPwmvCTkIAXed2ukEIBorOhCdnkvbG8gAHVg0W2jQIFpiixLM/WeQqz5sxPWsDJ
	 Qq5olD2EAH9oG7UAnfwRs4lCRGOcI3iHs402tux3Dukc3GLPNjKITWZlXSeBqkDPU1ihc
	 JcuPNlwxyZA0fWPf410Tz8F5b5w4St3h1iR7H4qnW6vV0CjhKB29DfsdqdQUtYL3cdN/r
	 CD3p83xpd6Gnr4z5U8s/+oNFrAzgtcJJ1K4zlP/5mPT/p3uKfYreQgxbJE0emj7Oy/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
	b=i19966Or8W+Qx1uJcGCVPlQOxdeL86sEIOECro9rvLzqqVcYvRLw/hdcXw0AYruuJkpD
	 s9Vdi4hChTt2Ildizv7xCHoXFiHq2gvQyEkgWJQsbNcc8SvDfA9XnPnEJrt3L8MZrYkFR
	 uiQGSE5Um1wni4CzXsEdl7B1ZRVej15GIP/b1mBiDmB6nkIW31Tke9U49g7tQW0Jtx7gc
	 1zU/ERyeTll99BMkUZ+ZbV1jkzArM1E9gqYzTXR19qbpB8a+mUvo2Sbb5GY3Z0OFjQ5Eq
	 odOH+4DdK/mP+ZspBsWD/aBg7OSOpMsOvqK464bGjipVJpL/TRzR/i490595m9weMCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juxvqAZe;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280D606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 16:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C280D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juxvqAZe
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930c0f9c1b1so182239185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463878; x=1794068678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
        b=juxvqAZeU6BW3EHRo+t8y2yK+G2HZ6d+tJubNtwHqUxBk4qAFhERDeDoTaxkWCJ5B7
         R4n3vXsYO+7IhVOmUpxXMAdBBNG8w8I04UD/SBNgo8AohvDYwSXpNOnQC+73RFiCkvFT
         P6MZ7IP6bBEDjRio+zP3E+6FQr/3ymLxtYD75R5ZSGwIaP2Q+YRMJkLDIg2FOlvrToE2
         0LrIR+QJHDnD/3FgbKW9/CRf7FRyDvmnq19YzpuRqEyXW5dufQdA4TpPmqjlrmVco3vW
         SxhI7PofeO0zF2FjlDni4XM+v+ouU22r6xMhwA/ferzA0GW8iXIHihOiDMxYqqV5VLuk
         5hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463878; x=1794068678;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVq0Ao/ZWudJCDsBPok2MvDiDplFAhMivQKS/BD/5Cc=;
        b=nYBfj8GvMTgOpVFTwv02oJGClOIMic8uod0UoyVdzuuIw9cO4FvZvc2fyAgsKF+4yq
         T+kl+tX7d+fSnR1JH1Ae+RxZu5UeSSYncPM4XUeD6Eu1ScYGqwtL7uJQq2jJlDupwu6K
         fU8VwpiurcqV4rWkRgtI7WYzDYX3dT7dzyFF178UQJVpDBEpZ6z3ETBOPo+7eQDXALr3
         oncZEi5rdlJ/c6xetwi2N/mtCWtLgbryfGNYyTev1+r5gc/BpR1MXZIgTlQ6gSafsTnj
         kXPi9X5NTgXe1VLC0M0YuyNujDr070KZQ/qTTUCvXaszB0Tsqo1eOdD++RScpOMFnpPD
         3E5A==
X-Forwarded-Encrypted: i=1; AKwUvBwjGndU6Kzqk9JSRmhDxUGsw8J4LLap+LtddZJ5PjKBNJiuwe5Jg1sK7VfQfPnHUzp1H8mBgrkoIh2G/SGD@vger.kernel.org
X-Gm-Message-State: AFq9FYLVOwreUgdkjljsUjAUvAVmUvBIlevuzLmnokRx8zG0D4TZ6ltE
	a4E66car8/rZwaH7Xyei2UL4T0ncy6nmG9kyT3be9oTUz0+2cEb5FOCb
X-Gm-Gg: AYBFou0T00pQuCfe/XNthzsfpyPOLa+fLnAUH0ybcG00wbXzrjSijakGLWAlK3UDpya
	v1xtJjAcpajtt7EAlDhX2Eo2ks+wITv0QWvSuheUTE3SbQBheZgM0dP5L82zAC8Lp6b1jIzVFij
	hwN41dP5/kgSS/E7YOMM+VPSA2P3/dfalob0bidCV/7yybn/bVNJzfQ/DITsWpQMUX2JAOb4ouX
	cmuRSZf4FAqq/wSS6WY9r/kHKY0ulGYQKPkNwo3zBiCQ7BN+1LGD2/KoiabddmjgQAyibmmMsT8
	pctDwGwZAaXHbwyPtnpu5zmhpxyhn6zCgD+FOCJyt7sR6LWAQbpVdqSXCdk9D/hLhN5zQ8g5yA1
	iRpVz3VfQhPYV7Tom3OUicl47BZRuWUs9wcjp/gqdG628AmLWmwe13deFREzhuIW7p584efZGOr
	QC4u1ZGdK3itGvCSzQXljOBlj8N5ZNzK5zef5bJ0MvjEuaYdWE+VclS0O46Aq+iTMW6kVIXR1hX
	+O/tACvbHt2REupb6Y3ejONPXKK9d9qKq62Uwg/LRK/irYPa1yABO6CPCas2IGc7RKyUFMFgFQ3
	Us0fHuHQPUffOaxuxE4j3hu4sVw9IqgYT1OZIZJchwoYuARfuR/KJh01gYCG06Ka5rzbLTT+VuU
	x0lv+9g==
X-Received: by 2002:a05:620a:471e:b0:93e:3824:4123 with SMTP id af79cd13be357-944216fef10mr997085285a.65.1793463877786;
        Sat, 31 Oct 2026 09:24:37 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414082885a.40.2026.10.31.09.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Elson Serrao <elson.serrao@oss.qualcomm.com>,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Sat, 31 Oct 2026 11:24:36 -0500
Message-ID: <179346368350.44447.7737375259522591871.x2e-share-m31@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

Before it, a USB SSD on a800000.usb dropped twice in a day with
error -71 and "not accepting address". With it: 28 GB written in a
stress test, and no such errors in 27 boots since.
