Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865334CFC6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132732; cv=none; b=g+hFLZCq6LlLIXNp9ynTL07ahTeMNefOY23lG3VzF8ZbQJMJrAfgPgvQhZJNKp5jU/Fx4JkaiU8abcJb+HJfm2vEjqreoVZ3BE0J8r/SmZ1t9OUQpBwHx4ho4aX7ZIMr+vYEcvHglL9e++fhZQ9pY4/ObiGctylf2q47QhP/T9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132732; c=relaxed/simple;
	bh=4S/lt/HkO1931UfN2Kg4poTFG5L0GtVxFxROTKf6rhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXjFdD9NPyz+zBTJsnUCFR6Q3pJwk+A+bh2o1xPiXyYuWw3sIsfMV5AerBVnwV+knENlzQpl+EbsklIkNQJEhP/wU6DRvumXnWHR42yeP7ZVtKlLgkstBiqglFW0GY4QEHHZDGbmg+xrBkj2kFUOUpQFaOGxrXjabyjneiDPjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fIDoXQwI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fIDoXQwI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c15bf5000so18430551cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132729; x=1786737529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLAj0swShmZIf0hJThyPujxzQ99VpzSptgNAwh7h5VE=;
        b=fIDoXQwIHe6LgIV5IqxtBwP57TgeFvBnCIBAg0wvO5Dr1/gxkMFqw7vz7WwbKArTPm
         7txvhlQtTb+YlhOALEe7842rACim12Oy0gluPMPVWrEbYhyz+ufPo4F5IN2bQmK/SGSq
         vCwLfeufvZl9mCbpPsI3pDTdyKkaDsfmLckbPwemCKNFRc/+7QIOaLdPxCifypf6Xdmp
         qoALrzWphOOgDYyiKJD+FemoFBmnYtSGKTKq06pydO0F41lunzbQXLxehz+UIAhJ4gMB
         wfI4u9nP9GzyIkQnDVo2hu165J6pcd/IQ6JOJo3pzJTbzRRY7YjCpM+Wbmknwqgq/LNH
         MEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132729; x=1786737529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLAj0swShmZIf0hJThyPujxzQ99VpzSptgNAwh7h5VE=;
        b=a9BQ/NeEecU0JirqP7gWjxD0d3c6AMjFjBYUXNg45lL1zeiY5Atvq3thWdOOSSpOY7
         70RyjZhW9RKCjXLRbHqVGPX04sDVQ6mvO7A8rxv2BtgmDIZzXtqjnSWPNJVgaMUgB4nC
         BEpCjVnE8lycNNLBF/3/tH3e/wlJJz9uyHiER+6QWOfLo2cwZ84+GFEm5Q5hqmFPVqWw
         1a1MmyzA6GnzoPkqqX3+lllW6sey8G3JXaS3Nu/yxTPDXR7xur9Tjpn1APAwWbwqcwIO
         Ez4T2SMjvjunQz5et4XJbxTo5af7Hy5UKKyLS+oAg4eV8d4R/bNPB5uDR69k26Wayany
         SVDg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7cmbsZpBJgXEbRU/3Kqbl7hjfbookp7QLunejOC+0u+SvlUKHs+m0XIGeMpZBd3cmhiiGsHk0TI+cNkq4@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9ymP0xWgBAmIhwAkXP0xSerAenXoBaoi2wR+bkIjoBzX9q5t
	h6rJzrI66b51mD9nNxGQy4J7NfYC5pwPFLVSbHcrnVm4fopTdKsxZ8RXzdgVVAZ4p8o=
X-Gm-Gg: AR+sD12hUaRodBTNHfZeNIvelPHKO5arb6I7GMNAU+VeOvcqsITu3Sr0StnJptQsFmy
	GXSXkolFvX3mZkN6bH+Ov6yt2EKzyHER5UcWpheXv56OHCCoLO5glBQ9xbr3s5TIcMDOOtDbZSt
	OqGQ54OIJeVJ/C0T0687WZPBFS2H0dODWMSxz1YYb1c97SEnK694hkToVGqkPf5QH80distt/tC
	+EcjCgljFt98+UTnx4UQanzWckeJVOx6kgxnHxj14DyObC5KfMqa2UF423saJ+4lUGlJ46efi1Z
	JPNxNLbJFCreF+ZfABT37oEcN1ZTsk5d2QZuUgS+qKpqv/GDw9jWPrcSgJ9tBukxTSy6/tErfzD
	JDO1gLTOXMdDDVxDKcFrfpoVAz3rbVsSc3xBZoaa6uYZwO3Tg5bCA21VckU3c+Yo2xCgFGTm5ga
	7LkvYzAZJ/ge7Wg4Xen+kk0DIMnyd6w1KZgFEazu1PrSxOasmEjQ1aDIp96u06PgNAYD1fg7vWg
	AM=
X-Received: by 2002:a05:622a:428c:b0:51c:9193:fd9e with SMTP id d75a77b69052e-52ce5ff10e7mr301001841cf.15.1786132729475;
        Fri, 07 Aug 2026 12:58:49 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:39 -0500
Message-ID: <20260807195846.456079-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on upstream support for the Toshiba TC9564 SoC I
learned that its PCIe endpoint function nodes included the
device_type property, indicating each is a "pci" device.  Herve
Codina pointed out that this is not correct; only a PCI device
"that implements a PCI bus" should define that property.

I looked at other upstream devicetree files and I found four other
places with this same mistake.  (All are for Qualcomm platforms,
and all are for platforms using a TC956x SoC.)

This series removes the device_type property where it is defined
for a PCI endpoint function.

It also removes the #address-cells, #size-cells, and ranges
properties in these cases, with a plan to restore them only when
they are known to be needed (to implement pci-ep-bus sub-nodes).

					-Alex

Alex Elder (5):
  arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI
    function nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: monaco-evk: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI
    function nodes

 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso  |  8 --------
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso  |  8 --------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |  8 --------
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts    |  8 --------
 5 files changed, 48 deletions(-)


base-commit: 064935ef6be39d086f4c40766d2b76181b70b3e1
-- 
2.53.0

