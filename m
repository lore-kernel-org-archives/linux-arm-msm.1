Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9493C5546
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363409; cv=none; b=o87xboWgFgSsV0kIkhBMVkWkq7sVmZ+7FdPGWq88P1zv9X2A/xUvz6IyEf1YlqEx/rwPtvWODYsnI94yWad6OAI5WYUHN8pZKu8mxuPHYLoiYPxoK4W9vuwYcG0duvWqGlVg/2bm10O8CHlN3f9sU0rDHMPZ3hwFhmSREnU6PT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363409; c=relaxed/simple;
	bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPcNcD8qMhuvSMu3afuTm6X3c8cGuwottwnmkRSLwK+8lKPKVAz0eaTYEhBPY0sYOB+LqE9k68lJBc0bqaIKBWZELE6hvYT+36wnOVGyGXYrE0ri0L3jGJZpTy5MNPEhGZOSzVcWBEOXk2UgCzJ9TUFWYS9XQmr81tL8oGerHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EM91OrC6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EM91OrC6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954afac04bso19554695e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786363406; x=1786968206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
        b=EM91OrC6iSjHGyComN3ObNfv6kyANa9CaFKZk6QHZjVrh1EGhxAyNzulN0InyTzvDq
         hpISuNJpCs6PV6bwqH2kqAuMI4tfUhHVrNHMf+7GyHzpYtM5xZP2/MufYzYHwfL2rF5p
         rfYYxRI0A0aDREFUV6GRwK70554WHPCemeDmJAH7/Sz7A6EL1bZbj+FGms/88Aj18DZi
         Mk9PvxfHOvXcZEmAVFwq1XqEQdQP4gwn5GvFjfZwHqUSvEn/Rf0hLb0OrHu984I52XrC
         wgCiirSetNnG/YfFrS//BcE1YXtI/NV7mh2mFz2F0j1nPZMcI9pGIRq5YJwB1IqWm3ls
         /jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363406; x=1786968206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vh0TxNq/fm5zGbnls35thYfK3Vc2p0h543Z+vBeSXys=;
        b=HXlApZMszUEsGDuep4ueDCSnDhBxquG9LIkKs1rHGw9XP5nP4hFZv9bg+t90je6eyZ
         QkNr6f5DLqHhX3bDmoZPR9h9WwcWGbAdzN+CFI7/nUbpndodQTeQJbMisYDbybZf7OIH
         z8hvlQuQmDkrK11DISmjZ7EpdnTgqvVV03LeCUF1xvEs/7qR6GtKHZQhD0xf4h/w2cO6
         eBvtOM0tcSASZXd7GS4ouRfCGbHaafYOmdVvvuVdJ2JKx8Hh5rCkSU1wZnxBJQvBpk7Z
         S4EvHZu5HkPpp+7hNetjugFulnebEHyyKDzV0/vRZ3bEE+Mr8QHhudIDrPwV1TmtRFmb
         TqGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnVmSYGVERjoiEs2KZoRuUPC+iShxS2OSbFuQhf1m/3X8sjtD7buyHdrEvVuFAp2I7V8bVoQK2doLkaAi0@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlR4+It/bxqUtEHnLSDpQUhlV5nqYob5G/23NestZosP2Sozf
	t0uHyWewEO3wEmEFNUaYaQD30Pq3lbiVan0lY7w+HiTQqwqk//HodBVB
X-Gm-Gg: AR+sD12fR1emAKW717P2a3lZ6NoM1GSnvSDy80YuJxzGqdpjvIJYYF8fYq7XDhZ593b
	m9XnY1oj8cVlegUzB+P+wI81qeAhvR7h2853dhDB0hyLdGiPgADZCReVTP/kHl1QJyJtKQPOWs5
	VUCAg7BGdG6FzGl821GAj1eLyRYMqppv9+1VrWVSpw3k5EjW4wut8Aa5LK2wRd7Xpu94L42sa2/
	Ut7jmPEgpuYbRWSesSNxiX5n7pCgRuqYiVYLKK2Hsim+Ho4AGdZzcnFBBSxj5cSiFDUlUbogaDq
	XD+JxdlYCYfYeh33ymdug4rkf5bLPCRSfYTNs8V0HtxzswmeCmCyp6MxO8RTkVyJD27pakJp+ww
	EgGzSFRO/x0O1yp5EJ1UpW7zs4O5M9gPF2g3666Sli64RlFCjLotC5rmiv7VN+ILAI0L5IOqjDd
	SVrso60vhiRMOKYgIiH0c4Jfv7Kmus2yxLrxZ6lXhcOX2YDAZsMs8oVYflCwTg2SoAFIcEl3Z1p
	UQ7h/n7lsg=
X-Received: by 2002:a05:600c:19d1:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4996199bd2dmr245762845e9.14.1786363405567;
        Mon, 10 Aug 2026 05:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f05:d403:3a00:9de6:4b08:7661:9451])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdc433bsm307615475e9.1.2026.08.10.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:03:25 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: oleksiionchul@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Mon, 10 Aug 2026 14:58:47 +0300
Message-ID: <20260810115847.253474-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717132218.27007-1-oleksiionchul@gmail.com>
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Friendly ping on this series.

Is there anything else that needs to be changed?

Thanks,
Oleksii
