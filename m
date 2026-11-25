Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604663;
	b=DcmxcqZxzgU1JDj/6/tmg+Mzqmv2MsBlvWrShn32PJp/XcctbFs+Nxn6MOf7gOf5ou39
	 +wgn3ka5QMlIwWsa+G0d/ZZ1vt1DO4b0o0mo4NdqxtHusY7/8pzhVLgsnPKlvukipA42J
	 MNylwxIK5jsKQdNXaEVguaeMo1MdL/VQkYUiIoV/6X+sLNsKLrQAZ2M9YxKVtLMvoa26P
	 jsCBeCg7wdLS3e6p05Bi8llZHKOK3K/cNU5P7+Y6/CR5dmQhKkuYrxE4o49KeFr8dS8mJ
	 DfyJpxKuEE4UMwm5rggEyYnAsuCGSi8IkSpZw+qbHijhOCdD+WSO3SV88dgNZSv4k3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
	b=d3qJji1AzjDcx4v6u0Rs3KrZLVk/tDO8ykrn9WZ81ygZI52Kuuvt7y8uSTnkWZVpKPFd
	 18RVOwXEUHg/4++I3BJiwVZNogv+Vz39n/ONGS+lQv+fYFc7yzExjITv4JXKzHPdg5/UD
	 aMgb43pPXl7Nsq4y6Nj4nKSXjwtHRXMGFlhb+8Zs5J60mIHvSgWTVi1Va5LBf9JC2JXKY
	 916oL1jNlLMFWhP1aI8bF65CTKFEBnHEiogBoqV3l63FLQ2qJuaV0gqKhx7ubhRVBjJMB
	 yPeaKnpPGyACuvLFkto2EJvJrdQU9awLbcaI1IEm//Eur5EtSs9LZf2RVsi+tyvBKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxHxlfsJ;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A2606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196A2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxHxlfsJ
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e47347279so3374618f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604661; x=1796209461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
        b=nxHxlfsJScaJkqSlCp5EDe8Z++zGF2Y9ulI439QJlYfxkM4FosITvzfG/UGtpJlryy
         wGfJH+Aefw+4Qj29ORsaSngZJCzfIiLtgPRBUCIJA/fOrtG3C83zDs80aPpRbA4UOZcu
         nQu8fb5kn5Q6WuyK56XbpQGBmm8q/Vz6m+iQl0CH4aFt02ympgt4F65C8tmDhr4Zd0Uh
         dK5whj5GBbsLWU/yZC/kqFR8UgDJvkPkqJeVEF0+6TlHRE5NluW9hp4SG1QLt29Myt7h
         foIO7G7fuozHuWamKxm2IUl2kkXpCUsQe94YGM2ODT7+MXvakUTovciYXaqi6EaB9nxR
         MAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604661; x=1796209461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
        b=io4uPCUxpvfIxIDBzclosh7ECQU/vdEyJjaO8Ted8FRdZ3ymukopvOUzzJ/bypgPjw
         DhjteA1cldFCvv8IyAeRLEdiUwm5MyQ9ueWRGN628DOYW8ki71usrmT9hgr5AkNrt/cS
         W6cwXOL7eqySHTZs3lT1plbHHsjglA69Wc9s68clF8JIBH7qMAZRkN/s/KLNYJsPXGPz
         x99h0JW7JN9V5TPS/6Zw5kY6Zk07V9Fe7KwAAx7f5x8ztNo5fPa32c35ooRtJHal24qK
         PFqaeu/610NJ0ezronxVjMBD8x639y1DFIWHpExTmFyI4dOnj942W2ZmdaGB7dr4oRpf
         cU+g==
X-Gm-Message-State: APuU4Z+4GpykJnxRdJfadHHfEv0AXIUjvciqRmpdE5VIHV+HRttOBWz7
	z3UfEmQeGxqTCg97tw2+PpkFiyzUVY/fhhBsjVRr/k6i7JJHPorALkbmFlgqxsMVFaw=
X-Gm-Gg: AZFdTZevQjlKJn8KIHc37AiLNedcgbEZJkfnQpbVzSCA5gHiXXwuorcCKFNJyIk14da
	7KbY4Yw6b9M3yc5dlhjjMYcFkQ83DLm/QpDW7DBmnfehVXfaiDAkl7rsCKfgYOei42FkZBWgQ8+
	husnwWThbkjmAbUeBkSFSynHkBoTj4R0r3xJpU6jxr5huw2p9ZgMPLhZ1nm9Q2tsWiCnb1IBMBw
	b5tdKyU4YeJpsLpxQ/w8Rgh2lcMedafCdaszZ5JI25WVT3M054VP8VpnH+WWBTC7sU+VG9+oCmx
	AfrMELKB+gBgXG8WHJyaCmb1foNNaOu9GdScYhulZDp35lTGJW9tlL5wryOxTXejCuWh0J5qR5Z
	9vW4Kl9fgcNe9v+l8b4mPb47B680fD1S2QESJIKAB6F+e/eKeLEP04siJaZCEmlcEt+5GPuxK06
	GxkGG5BQZSM9/zN0DhULTi4A3WFA2vpWYl9vOELQmYqlYfs4cSGgtLGixhHfUmP+0PFvWfdTATN
	dTXK4wAD0SxTgzWRc5WUBhLzIlxLaLNa0HEn93OwJkE9oDfysbAXDpx2xkyLYLcQYIE8UueaaYR
	dHRzYY3mIQK5LVVGI8YGyevaBQM6IRjsrTBgiA8yfXGJ41NF9Q==
X-Received: by 2002:a05:6000:2308:b0:49b:587:121a with SMTP id ffacd0b85a97d-4abb36787afmr35853811f8f.16.1795604661226;
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] usb: typec: qcom-pmic-typec: properly tear down
 port on remove and shutdown
Date: Wed, 25 Nov 2026 12:04:16 +0100
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIALDABmsC/4WNQQ6CMBBFr0Jm7Zi2CRhceQ/DoowDjBGKbSUa0
 rtb8AAuX/5//68Q2AsHOBcreF4kiJsymEMBNNipZ5RbZjDKVFobhdHNQhhpHvFJbsRO3hyQamL
 NVUnlSUF2Z897kNVr8+Pwau9McRvbGoOE6PxnP1701vv3sWhUWFtdmq5WVdfay0Mm693R+R6al
 NIXudmwYs0AAAA=
X-Change-ID: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ly4lxYiWzcIWv4i64fkqCzQ6H3oU2miiVMpCcOlwbe0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCyBxKcrONT3jFV5vwlMpMTTlM7pOnwHic/s3NG
 91fJFDiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAsgAKCRB33NvayMhJ0WVDD/
 49aTLH7ARG56niDsFnj/vO58UDGF0439Geh5J0b5B9Xd3bJa4zIK4ewfpsuOQVuK44ox3DUEXT12Rn
 6BXNLIywiADOi9/S3iRgIL71HqVUvAQ28thNY/qKdDf2RZkmNbq5/hpEvpTwrMcUYF+y7UKm/LGr1J
 PzvO61xke/6H+dHUnZdxB2cg2j9UvpFWOQ3+oPxR9AhYmIxpP4qEH9Ozi9MWzzoFUmHz0ngBasQXaw
 6rjpDX28rz7gu9OAGcUPnS/tyeqAUza0/oBYoE2ZM8WtR63tpEK48fQCpMYmz3/0jRbeFaK4+XljRi
 XXM7wUAkazjR6nehnyR1WuhWfzrnuGyZjSk1Xn74ApfOZDg+Gujj7uvIPUcEJPWcZujJ2TKDjGds/c
 hcKExqBX48HJ5oqNzZRljX+0azKotgo6NpcgjfBvZ7QAdzflKPeU8r/XhAWo7nU7Ljmu5m2b6aJfb/
 OT2fKklf+QIVlXBEIO3KSGZ0oQZP5x6d/tzUbI0N4KwYtEOFIuDnjZcaw9kgm2KLeEkiaoKY+TnAKl
 IfU/uCaHZSZVbvh7oNZWKBPU4F+LRZqa3zvmg3v/8MFh/509cg0dPqEAHmyWxnBNGbI7LznJhe0s3J
 3hWT0YIPjek5Pca73kyscgGdnpUOY7zCVHRmsLTuupvzbiTAVfhitY/ztAaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The current driver doesn't leave the port in the same
state as found when probing, and leaves the port enabled
on system shutdown.

Loosely depends on [1].

[1] https://lore.kernel.org/all/20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add Fixes and review tags
- Also disable on remove
- New patch: switch to SNK_ONLY before DISABLE when disabling port
- New patch: detach the port on probe
- Link to v1: https://patch.msgid.link/20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org

---
Neil Armstrong (4):
      usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY on stop
      usb: typec: qcom-pmic-typec: detach the port on shutdown
      usb: typec: qcom-pmic-typec: switch to SNK_ONLY before DISABLE when disabling port
      usb: typec: qcom-pmic-typec: detach the port on probe

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 12 ++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  1 +
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 32 ++++++++++++++++++++++
 4 files changed, 46 insertions(+), 1 deletion(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

