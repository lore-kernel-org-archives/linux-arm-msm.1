Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597652;
	b=v70V61wDroKdOHdSjLc+IXrUwdAhHFRj/hqRscbFwabg84s0inCx6vsPtls1INWaCgS/
	 2z2tmwVgZKRoowxpSDMCwAA9wWRJ7MrFI7QEVRnPdPVWU2VjlidMwxvkDiRw3+lYjsDts
	 Nx5WtO+Kqgy5m6jgcOrfbRnhfF/qwZtq/RTPB/sKyUuopnbhDbWHK8GAJMdegU/jrrsNF
	 LOYOADv6KkBxSo8AL87LAumpENYb91iCz73sY40Ul+TXlD+MWknq5XrK3vZZueNDDCkyw
	 w9Gk+xAo9MEx/VUENad/aiqJQdsZgBKBW7J1CgWwUx6ZbOCB1qQg30h0z5iYv53j2pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597652;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=vycvynL9eYvQ22hro9Cx4sxJ4Ghk9f1KZTKnvjOxUV4=;
	b=2/xlrOZvEr1GU406yONz1ne5i872sj7ch9BkhBWe3DqhrM8SZX/EcN4E5XZjRzdcjy/y
	 ZTIEjt01gPqqkcfJ5InV7SJwzNPX5GoysXlhytXAM3SRbGMw22L+qpVjWF+ZpdRG4awwN
	 lt0XWofW5D5CxSBV9zgeMb5KYYNg0NW1F8cbXc+CKXPcPtRCuHKiY9c8gLjUXu8PB3Do/
	 F42ufedEZD9j5tAygyi2yi9R0kUoWV4V0avwGAs6dni37xs3TrFB94sDlV7QkVs6MetyF
	 DF7yfV2Ji7qVcLJVT8SkgwDipO+ZG76mrjAAHCeY2+UytRq98OluLDLvm1rQcJpmpDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=N5+7pqH0;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F03606A31E;
	Wed, 25 Nov 2026 09:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F03606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=N5+7pqH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	MIME-Version; bh=vycvynL9eYvQ22hro9Cx4sxJ4Ghk9f1KZTKnvjOxUV4=;
	b=N5+7pqH0CI3OCLI5bMKzUDs6ywmsuNbMYwW5TuyLnoHSMFche+lJHkHOw2Jy8e
	mUs7oVwrQz2vNSmVaFDwVUOsmHdl+8uauScTWeHt2xyyKZZFvk8fl+GzaIyse0MK
	PfzGqpxn8LzEfPxGHBmcsdZ1X+rp5MHgY/bW7jpE5dWj0=
Received: from [127.0.1.1] (unknown [114.214.177.196])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB37TE+pQZrMrj2AA--.694S2;
	Wed, 25 Nov 2026 17:07:10 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Kees Cook <kees@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>,
 Guilherme G. Piccoli <gpiccoli@igalia.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] pstore/ram: refuse zones overlapping the initrd
Date: Wed, 25 Nov 2026 17:07:09 +0800
Message-ID: <179559762994.96050.5409562801088468974@mail.ustc.edu.cn>
In-Reply-To: <20261116040049.434247-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgB37TE+pQZrMrj2AA--.694S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1DXrW8trykKryfCFWxJFb_yoW8XFy8pF
	W3tryjyw4kKr40v3y8Ar40qw1ayrWfXa15XF15JryDA3Z8WF1IvFW0kwn8XFW5Xrn3W34Y
	vFW5XasrC3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU86c_3UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

Hello Kees,

A short ping on this series (posted 2026-11-16, no reply so far): is the
shape acceptable, or would you rather see the overlap handled somewhere
else?

The problem in one paragraph: on this board the bootloader places the
initrd at a physical address of its own choosing and cannot see the
device tree reservations, so the buffer can land inside a ramoops zone.
The zone is registered a few milliseconds later and the console writes
over the initrd, which then fails to unpack ("invalid magic at start of
compressed archive").  2/2 skips such a zone for that boot and says which
one was dropped; 1/2 is the helper that reports the initrd's physical
range.

Open questions I would rather have answered by you than guessed:

- Layer: the check lives in the ramoops probe because that is where the
  zone becomes dangerous.  If you would prefer it at the reservation /
  memblock level instead, I will move it.
- Cc: stable: I left it out, as it needs a bootloader and a device tree
  that disagree about memory.  Say the word if it belongs there.
- The one limitation is documented in the code: a module loaded after the
  initrd is gone cannot see the overlap and gets no protection.

I am happy to resend as v2 with whatever you ask for; nothing here is
pressing enough to justify nagging, so this is the only ping unless you
would like another.

Disclosure: this series and this message were prepared with the help of an
LLM coding assistant; the reproduction, the measurements and the decision
to send are mine.

Best regards,
Qianhui Xu

