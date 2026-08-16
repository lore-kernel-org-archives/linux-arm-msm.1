Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D738B7A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867951; cv=none; b=EBzo8JdAdOcXRlVkOs0x4cSLQdXgUK1ST92ZjkGxwdJmS+MnuGZ768mfR3nFwctrQGb6uJS0+LyrwFoMfcvn3t9rBYwv/zQ9PE0DAzzScX8aKza1sVVSuQVxnAQalgNYBv9C1URMFEEOuMLkTVA+NXUaRS0TQJq7XsYQkm55Pjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867951; c=relaxed/simple;
	bh=kUEfs1GTUSAsCblsYMy5HE6hfhWD4jASj6qcD9GRLHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZlHDadyxCKV6xorcAb5WorWBFD2fhmsLG3NsCy2muTV3P2PTw126t/8v191WGvi0PQEF8ez9K3l52CQADzZn11m0GUWkDWAJfLFzEOpwBSbpRFRZP55PYIqTFXfzuHarU9n03r0oHzFq+Q1aZMYS99TZaWk9DiH05lT355rMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmH6Qkxi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmH6Qkxi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce7d2adef4so40608835ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786867949; x=1787472749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SoBVT1Z9eZgY9CeoVlJHulg/Kfbf64+fh3GichmsKc0=;
        b=XmH6Qkxi/0LFYlRje+UYsQQO3/e9g7Ll6zXvbISkoQuFQP5zO0fJFWJZV1dlw/OWFY
         aDDkAj/70UdCMfZgR4aG89ZXlf7BKBnxQq8OzyBwrZLkQ4WGrwKGyOWIMHBsEjMPO+92
         NXfZ6jJQecYnv7JRn37mZ2v3q/NY7IaThN6nGniOyXZ9KKRZVipaFDZJIylgWq7ndwif
         11G1B3jSgYnBZqfzYWEKzjqki66MKRpW288U3JtYBW4dGRWb4cHhj3iAIrSE1vOuRrK6
         o5MO7+hyvRn6iUZMG8s/XAnKu/dnSYiockImnGLK1yAUsOwlNds7IU8weXD+9gj6hpqZ
         OSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786867949; x=1787472749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoBVT1Z9eZgY9CeoVlJHulg/Kfbf64+fh3GichmsKc0=;
        b=JzTrGO0k3RqGpa8gZ6VJRqeXu8wDh9YzS4adS2T0K9tIu3yFyXSkF7YO0+GeGa4oPa
         JUbdJrWKzcCZ1kNwPe80fuOiGfeCOZWBBxphOeIdz4Hk+obAKgqxWwTcjn16hq5x7XNq
         ztg9jTZlBEl0+JeG1Cb+0LCLpXPoqT0C34go+Z2EBkITdl5MBjqR+grXsIGoFXa+F6nH
         6oLACPhUWYVfZ0xdfk9hOUzV+YN+6IXpjaxWqXiXs49oK9LXIni+zG4vUx3Z9lC2NACx
         uN0Kpe2qKz7uR/VAuXPlivWdQ4ixD5IHNtCJYbfnKEaF+fzpFfCPtShY1Gsb+ShR65jx
         MQmw==
X-Gm-Message-State: AOJu0YxPBqbZVQxpz1vr0YpP6oz4c2vE8jXAwRDTq0vStd3bHWDCtgXQ
	pqKn952u67iIrrBM+URzs1BsZrBnSqBt3UGawqInF2x2p0p/O7WDgUdG
X-Gm-Gg: AR+sD12prsBQCvLvJMoRkW96AdQvk/CHxXMMFu9AcN5kqDXkCh64xWokmoI6Q8+ad/L
	k/p5UtL6Sxf04UloXkwVV9Mz3ysgIISLCH9oQtSP9951QTjDaeoK02rt+JG1hifBOaTqkGliSuq
	dqaOBJ4dBp7dj5c79j/3tFJuJSZINtfvmrzkUptQ4TibexJzwuXzygjTlzTfjSQ+PUSYx9M14Zt
	TmXpdn/Ixh9G9P7QNIJb80jblOJ4ARNI75SYCqBqxJUoAevzsKpkZ9Tg4AXXpgYG0jemzF8znBk
	ZVNLzf/ixaswVytnQkQa0zWvJ2C1AXp/esp8WJ2Ckgs7oc1KAWby0/tvcByz5SogrKVvSb1Lwsz
	dpnYMGZyYB2s6nUja2s8YnU16UkDqIHTvbwUNSWz3PFcNgJT8NjdzYRT3OC6nMOc3wybDyhxu0+
	8D5tmK7E9NYJEpXEU0gnkZOPyh7h1hw/ktCzeod+x63cmkZcmtzHrQoGsuIBMmFA/GOEbT7tGgn
	SgyuQPtn+Qm
X-Received: by 2002:a05:6a20:918c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cc71c61e5dmr18863541637.22.1786867949337;
        Sun, 16 Aug 2026 01:12:29 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm23716838eec.28.2026.08.16.01.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:12:28 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add Qualcomm SM7250 SoC ID
Date: Sun, 16 Aug 2026 08:12:11 +0000
Message-ID: <20260816081213.5495-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 SoC is known as lito.
This patchset add SM7250 SoC ID.

Sreeshankar K (2):
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

