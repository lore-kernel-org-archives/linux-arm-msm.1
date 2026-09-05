Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C1395AE2
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788603927; cv=none; b=ExfAfO1YZJf9BuHxVaQ175O1Zlm0x6qJlQZPfpJO6sAQc3BKSHTa1RpeZWqptq/VJ/zj7ot8PAinjakYH/f70zccgRpKoTxspUZZoPLrX/+fwjMIE+1f5+OS7iZUtnhWAGQ00EMYpmOm74NuMi6NyRm6asSY0fh08k0dkzWAnAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788603927; c=relaxed/simple;
	bh=eGXgx+hcAKyGmp8q0icQVJnjuGTfMBxz2LgfdEs2BLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GSbG1MaE4qp0qA7dw1VM46uo4yUiNh8aB1g3x5h172dUcUI88RFk78buX3wB9zw+f4zJ9AKXA8RarZHV0HGA2kxLMoYy1QYQXs78LxIXSsANRZ0Tf1X6zBUZqWK96h4eOc+9K2Qxi6o9V0d2Su1whXR2sBBdQA6+uNSetr8I70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sT7mj5hv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sT7mj5hv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e257a23aso1295648f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788603924; x=1789208724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3akeHPjtNJgVs2eeVfuYjm/Liw9l2u5Y7OVSBtrpu4=;
        b=sT7mj5hvoNhjcWtYnWHsfwvrx8n8MtF0Sq+tYYFDQfVWBw8a7HbJi9AU0NukafFZ+6
         T0PXTW94l4I6nwDn3RaT9+jEzTJwGPawMyBUYhbQP9pHd2fXnZJa0F2F0fyMa+jk4Ylr
         sNQJwPUUBEGprgGyMsAVRsOl5k3AdCl2I8Pa8Gb+A9oLTG3KTDWEPelfwFzoCOekilq0
         FTjdu0+/P/qsaiT8wawyCwuR5GkAY8poFMpiv7UDIoOwIkhhEWs0zkb6MP8LQUNzCQg2
         xyaPFOEtSiryofeTZS8Vbyv2e1tTzLVkXgV8ik+eAHy+lby2IoO5xKnzXGhljZ43w+Zh
         Le1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788603924; x=1789208724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3akeHPjtNJgVs2eeVfuYjm/Liw9l2u5Y7OVSBtrpu4=;
        b=X1efTfJ7Y1Mgk7ia0u28fozspMpUVWRTXd5pPE8E8O8vxGU1kf8WX+zKWnMe6W0T2L
         NqN8wd3h/a4365zDpbzFGpGyPiKQ0d6PaCck6wr0dBBZWfA+5K1muDVK9Q5bMWAK/Oz/
         ZlZVPqmSmTp9FwRaSRXuUA8Sv4Q9IpUL2PpYO5cttKTIWaEtv6I4cU1KnfYwsKIWoLU2
         h85dxsPprQRlLkleZWJYCneeAoqSucj3NnpKWyWN1MJa6sBenlK5S6GgL2ShHD4F3yx2
         l204+t4Ey9gGz4D19zonYp3/EP6wtYs9UttBXknXgU3/sz+zXYFWp5x0j/aPUYMaFg9f
         +1cQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV7zHTSTP1QsNYRlHi/vxmwPegmKMH0RFA1WbDDNJSqS94LvOto/dec6z/zEipbsqPOuKqhrzP32g17K1I@vger.kernel.org
X-Gm-Message-State: AFuF++m+am59+jO0VJo+g2Faz70NJGr4bXH6zOU4qMsSkzjZrsxrS6zl
	E8DAEmkTRlswPFSOUUDavmY18YKu8eVXI+ht7Wo3uAfwq1MC9j5UYOm0Qux6yBpa
X-Gm-Gg: AYBFou0ZIBHInhrycfnnIB1m9qn3uXJHCQfuirFDrSRDYFemnE1Mngh5qZvInEnqg87
	UFn59B6IBhJfxpH+S9XMOzHOeLBtKv8I4aI6Nvj0kVko6oDHdKbTUZz2+H5pLc267IPF73zExSO
	J6Q0y2R5vm14KGqPDcf9g2l2XVItXM7VXN27sIL8xpM7AbjyYchstXTWYjpho96/X6f7LQa8Tsm
	b8N99QBXG2PWP+MEm7ld/xXX6WDXjuL9SM40RzD3C8yls3L3CtKT8nmdGsYLG20HZt6LSaQJmmY
	GeU6M3tLF4Y2Tli7UACSxn2rYYl+bitBXSMaA7JVZwPXY+DE647DMGj00z9tcidWoc+7nW/Axnj
	HWfjThwK9CbhSaajyHoDABVFDgOtkavc9LsEXH2+eL34EE6sxsWGLCuIqbbvpjWtlRN0DHVqDYu
	swYMWCVOhnRlXtn08jyb3lhJNV1K6hxHJgW6NDhUwPPQEhIc64T7FwesNtjUploReKz2db9li5e
	84FPqLEWb/5vqT7/3eF93Mw5j2YIvLkO9/fde23dLvT+qoaZOFvtF6P1MRBcNS9V3/iDiPAsfGF
	WFVfJ9E99bqhAIi1MsLDU4AReD6FcjpjiYzYVoTYMxYfupKJYiwWaiyoXIBz8DXp498=
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49cffa00196mr48321255e9.6.1788603923899;
        Sat, 05 Sep 2026 03:25:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm295147235e9.15.2026.09.05.03.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:25:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: dcc: Remove the debugfs ABI document left behind by the driver removal
Date: Sat,  5 Sep 2026 12:25:19 +0200
Message-Id: <20260905102519.43066-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c5d52d7bf241 ("soc: qcom: dcc: Drop driver for now") removed the
DCC driver before its first release, but left its debugfs ABI
description in place. There is no driver behind
/sys/kernel/debug/dcc in the tree.

Remove the file.

Fixes: c5d52d7bf241 ("soc: qcom: dcc: Drop driver for now")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/ABI/testing/debugfs-driver-dcc | 127 -------------------
 1 file changed, 127 deletions(-)
 delete mode 100644 Documentation/ABI/testing/debugfs-driver-dcc

diff --git a/Documentation/ABI/testing/debugfs-driver-dcc b/Documentation/ABI/testing/debugfs-driver-dcc
deleted file mode 100644
index 27ed5919d21b..000000000000
--- a/Documentation/ABI/testing/debugfs-driver-dcc
+++ /dev/null
@@ -1,127 +0,0 @@
-What:           /sys/kernel/debug/dcc/.../ready
-Date:           December 2022
-Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
-Description:
-		This file is used to check the status of the dcc
-		hardware if it's ready to receive user configurations.
-		A 'Y' here indicates dcc is ready.
-
-What:           /sys/kernel/debug/dcc/.../trigger
-Date:           December 2022
-Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
-Description:
-		This is the debugfs interface for manual software
-		triggers. The trigger can be invoked by writing '1'
-		to the file.
-
-What:           /sys/kernel/debug/dcc/.../config_reset
-Date:           December 2022
-Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
-Description:
-		This file is used to reset the configuration of
-		a dcc driver to the default configuration. When '1'
-		is written to the file, all the previous addresses
-		stored in the driver gets removed and users need to
-		reconfigure addresses again.
-
-What:           /sys/kernel/debug/dcc/.../[list-number]/config
-Date:		 December 2022
-Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
-Description:
-		This stores the addresses of the registers which
-		can be read in case of a hardware crash or manual
-		software triggers. The input addresses type
-		can be one of following dcc instructions: read,
-		write, read-write, and loop type. The lists need to
-		be configured sequentially and not in a overlapping
-		manner; e.g. users can jump to list x only after
-		list y is configured and enabled. The input format for
-		each type is as follows:
-
-	        i) Read instruction
-
-		   ::
-
-		     echo R <addr> <n> <bus> >/sys/kernel/debug/dcc/../[list-number]/config
-
-		   where:
-
-		   <addr>
-			The address to be read.
-
-		   <n>
-			The addresses word count, starting from address <1>.
-			Each word is 32 bits (4 bytes). If omitted, defaulted
-			to 1.
-
-		   <bus type>
-			The bus type, which can be either 'apb' or 'ahb'.
-			The default is 'ahb' if leaved out.
-
-		ii) Write instruction
-
-		    ::
-
-		      echo W <addr> <n> <bus type> > /sys/kernel/debug/dcc/../[list-number]/config
-
-		    where:
-
-		    <addr>
-			The address to be written.
-
-		    <n>
-			The value to be written at <addr>.
-
-		    <bus type>
-			The bus type, which can be either 'apb' or 'ahb'.
-
-	        iii) Read-write instruction
-
-		     ::
-
-		       echo RW <addr> <n> <mask> > /sys/kernel/debug/dcc/../[list-number]/config
-
-		     where:
-
-		     <addr>
-			The address to be read and written.
-
-		     <n>
-		        The value to be written at <addr>.
-
-		     <mask>
-			The value mask.
-
-		iv) Loop instruction
-
-		    ::
-
-		      echo L <loop count> <address count> <address>... > /sys/kernel/debug/dcc/../[list-number]/config
-
-		    where:
-
-		    <loop count>
-			Number of iterations
-
-		    <address count>
-			total number of addresses to be written
-
-		    <address>
-			Space-separated list of addresses.
-
-What:           /sys/kernel/debug/dcc/.../[list-number]/enable
-Date:           December 2022
-Contact:        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
-Description:
-		This debugfs interface is used for enabling the
-		the dcc hardware. A file named "enable" is in the
-		directory list number where users can enable/disable
-		the specific list by writing boolean (1 or 0) to the
-		file.
-
-		On enabling the dcc, all the addresses specified
-		by the user for the corresponding list is written
-		into dcc sram which is read by the dcc hardware
-		on manual or crash induced triggers. Lists must
-		be configured and enabled sequentially, e.g. list
-		2 can only be enabled when list 1 have so.
-- 
2.53.0

